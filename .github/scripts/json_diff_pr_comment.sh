#!/usr/bin/env bash


printf 'Initializing script\n'

shopt -s globstar
set -eo pipefail

# change to working directory
cd "${1:-.}"

# special header string to use to identify comments
header="$(printf '<!--%s-->' "$(basename -s .sh -- "$0")")"

# github api version to use
github_api_version="2026-03-10"
printf '  GitHub API version: %s\n' "${github_api_version}"

# get the API URL for the PR's comments to interact with them
github_pr_api_url="$(jq -r '.pull_request._links.comments.href' <"${GITHUB_EVENT_PATH}")"
printf '  Endpoint URL: %s\n' "${github_pr_api_url}"

# convenience variables for curl headers
header_auth="Authorization: token ${AUTH_TOKEN}"
header_accept="Accept: application/vnd.github+json"
header_api="X-GitHub-Api-Version: ${github_api_version}"


printf 'Initializing git\n'
# add a remote for the upstream
git remote add upstream "${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}"

# fetch upstream/main branch for diffs
git fetch -q --no-tags --prune --depth=1 upstream +refs/heads/main:refs/remotes/upstream/main

# `git diff` ignores untracked files, so make a dummy commit with all json files as a workaround
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git config --global user.name "${GITHUB_ACTOR}"
git add -- ./**/*.json
git commit --allow-empty -qm 'dummy commit message'


printf 'Analyzing changes\n'
# get a list of all the changed json files
readarray -d '' changed_files < <(git diff --name-only -z upstream/main -- ./**/*.json)

# get a summary of changes
summary="$(git diff --compact-summary upstream/main -- ./**/*.json)"

# initialize the body of the comment with some boilerplate text
# shellcheck disable=SC2016 # intentional
body="$(printf '%s\n\nSummary of JSON file changes this PR will cause:\n\n```\n%s\n```\n' "${header}" "${summary:-"No change."}")"

# if the summary isn't empty (meaning there are changes), prep to add the diffs
if [[ -n "${summary}" ]]; then
    body+="$(printf '\n\nDetailed diffs:\n')"
fi

# go through each file and add its diff to the body
for file in "${changed_files[@]}"; do
    # shellcheck disable=SC2016 # intentional
    body+="$(printf '\n<details>\n<summary>%s</summary>\n\n```diff\n%s\n```\n</details>\n' "${file}" "$(git diff upstream/main -- "${file}")")"
done


printf 'Retrieving existing comments\n'
# on every commit, check for and delete previous comments that have the same header.
#
# note that the GET method only returns up to 100 comments, so PRs with a lot of
# comments would need to get paginated
mapfile -t existing_comments < <(curl -s -X GET -H "${header_auth}" -H "${header_accept}" -H "${header_api}" "${github_pr_api_url}" | jq -r --arg header "${header}" '.[] | select(.body | startswith($header)).url')


printf 'Posting new comment\n'
# add a comment to the PR showing json changes that will result from this PR
# this line does a few things:
#  - use jq to JSON-ify the body text
#  - pass jq's stdout output via pipe
#  - curl accepts jq's output via stdin as designated by "-d @-"
#  - curl then posts the text to the PR using the secret token
#  - finally, saves github's json response
response="$(jq -cn --arg body "${body}" '{body: $body}' | curl -s -X POST -H "${header_auth}" -H "${header_accept}" -H "${header_api}" "${github_pr_api_url}" -d @-)"

# if $response.message is not null, then there was an issue creating the comment
if [[ $(jq -r '.message' <<<"${response}") != "null" ]]; then
    # output the message and body for logging purposes then exit
    printf 'Error creating comment!\n'
    printf '  Error message (%s): %s\n' "$(jq -r '.status' <<<"${response}")" "$(jq -r '.message' <<<"${response}")"
    printf '  Body of comment: %s\n' "$(jq -cn --arg body "${body}" '{body: $body}')"
    printf '  Full response: %s\n' "${response}"
    exit 1
else
    printf 'Comment created: %s\n' "$(jq -r '.html_url' <<<"${response}")"
fi


printf 'Deleting old comments\n'
for comment_url in "${existing_comments[@]}"; do
    response="$(curl -s -X DELETE -H "${header_auth}" -H "${header_accept}" -H "${header_api}" "${comment_url}")"

    # if $response.message is not null, then there was an issue deleting the comment
    if [[ $(jq -r '.message' <<<"${response}") != "null" ]]; then
        printf 'Error deleting old comment!\n'
        printf '  Error message (%s): %s\n' "$(jq -r '.status' <<<"${response}")" "$(jq -r '.message' <<<"${response}")"
        printf '  Comment URL: %s\n' "${comment_url}"
        printf '  Full response: %s\n' "${response}"
        exit 1
    else
        printf 'Deleted old comment: %s\n' "${comment_url}"
    fi
done

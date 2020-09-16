#!/usr/bin/env bash


printf 'Initializing script\n'

shopt -s globstar
set -eo pipefail

# special header string to use to identify comments
header="$(printf '<!--%s-->' "$(basename -s .sh -- "$0")")"

github_pr_api_url="$(jq -r '.pull_request._links.comments.href' <"${GITHUB_EVENT_PATH}")"


printf 'Initializing git\n'
# fetch master branch for diffs
git fetch -q --no-tags --prune --depth=1 origin +refs/heads/master:refs/remotes/origin/master

# `git diff` ignores untracked files, so make a dummy commit with all json files as a workaround
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git config --global user.name "${GITHUB_ACTOR}"
git add -- ./**/*.json
git commit --allow-empty -qm 'dummy commit message'


printf 'Analyzing changes\n'
# get a list of all the changed json files
readarray -d '' changed_files < <(git diff --name-only -z origin/master -- ./**/*.json)

# get a summary of changes
summary="$(git diff --compact-summary origin/master -- ./**/*.json)"

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
    body+="$(printf '\n<details>\n<summary>%s</summary>\n\n```diff\n%s\n```\n</details>\n' "${file}" "$(git diff origin/master -- "${file}")")"
done


printf 'Retrieving existing comments\n'
# on every commit, check for and delete previous comments that have the same header.
#
# note that the GET method only returns up to 100 comments, so PRs with a lot of
# comments would need to get paginated
existing_comments=( $(curl -s -X GET -H "Authorization: token ${GITHUB_TOKEN}" -H "Accept: application/vnd.github.v3+json" "${github_pr_api_url}" | jq -r --arg header "${header}" '.[] | select(.body | startswith($header)).url') )


printf 'Posting new comment\n'
# add a comment to the PR showing json changes that will result from this PR
# this line does a few things:
#  - use jq to 'jsonify' the body text
#  - pass jq's stdout output via pipe
#  - curl accepts jq's output via stdin as designated by "-d @-"
#  - curl then posts the text to the PR using the secret token
#  - finally, saves github's json response
response="$(jq -cn --arg body "${body}" '{body: $body}' | curl -s -X POST -H "Authorization: token ${GITHUB_TOKEN}" -H "Accept: application/vnd.github.v3+json" "${github_pr_api_url}" -d @-)"

# if $response.message is not null, then there was an issue posting the comment
if [[ $(jq -r '.message' <<<"${response}") != "null" ]]; then
    # output the message and body for logging purposes then exit
    printf 'Error POSTing comment!\n'
    printf '  Error message: %s\n' "$(jq -r '.message' <<<"${response}")"
    printf '  Body of POST: %s\n' "$(jq -cn --arg body "${body}" '{body: $body}')"
    exit 1
else
    printf 'Comment POSTed: %s\n' "$(jq -r '.html_url' <<<"${response}")"
fi


printf 'Deleting old comments\n'
for comment_url in "${existing_comments[@]}"; do
    message="$(curl -s -X DELETE -H "Authorization: token ${GITHUB_TOKEN}" -H "Accept: application/vnd.github.v3+json" "${comment_url}" | jq -r '.message')"

    # check if there were any issues deleting the comment
    if [[ -n ${message} ]]; then
        printf 'Error deleting old comment!\n'
        printf '  Error message: %s\n' "${message}"
        printf '  Comment URL: %s\n' "${comment_url}"
        exit 1
    else
        printf 'Deleted old comment: %s\n' "${comment_url}"
    fi
done

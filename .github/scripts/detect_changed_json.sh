#!/usr/bin/env bash


printf 'Initializing script\n'
# set some options, including globstar and pipefail
shopt -s globstar
set -eo pipefail

# change to working directory
cd "${1:-.}"


printf 'Initializing git\n'
# add a remote for the upstream
git remote add upstream "${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}"

# fetch upstream/main branch for diffs
git fetch -q --no-tags --prune --depth=1 upstream +refs/heads/main:refs/remotes/upstream/main


printf 'Analyzing changes\n'
# get a list of all the changed json files
readarray -d '' changed_files < <(git diff --name-only -z upstream/main -- ./**/*.json)

# make a decision
if [[ ${#changed_files[@]} -gt 0 ]]; then
    printf 'ERROR: JSON files changed:\n'
    for ((index = 0; index < ${#changed_files[@]}; index++)); do
        printf '  %s\n' "${changed_files[$index]}"
    done
    exit 1
else
    printf "No JSON file changes detected\n"
    exit 0
fi

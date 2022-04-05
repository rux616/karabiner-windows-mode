#!/usr/bin/env bash

shopt -s globstar nullglob
set -eo pipefail

error=0

# change to working directory
cd "${1:-.}"

# test jsonnet and libsonnet files
for file in ./**/*.{j,lib}sonnet; do
    error_this_file=0
    printf 'jsonnetfmt --test -- "%s"\n' "${file}"
    jsonnetfmt --test -- "${file}" || { error=1; error_this_file=1; }
    if [[ $error_this_file -eq 1 ]]; then
        jsonnetfmt -i -- "${file}"
        git --no-pager diff --unified=0 --no-ext-diff -- "${file}" | tail -n +5
    fi
done

exit ${error}

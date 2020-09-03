#!/usr/bin/env bash

shopt -s globstar nullglob
set -eo pipefail

error=0

# test jsonnet and libsonnet files
for file in ./**/*.{j,lib}sonnet; do
    printf 'jsonnetfmt --test -- "%s"\n' "${file}"
    jsonnetfmt --test -- "${file}" || error=1
done

exit ${error}

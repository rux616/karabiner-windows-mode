#!/usr/bin/env bash

shopt -s nullglob
set -eo pipefail

error=0

# set input and output directories
input_dir="${1:-.}"
output_dir="${2:-.}"

# render json files
for input_file in ${input_dir}/*.jsonnet; do
    output_file="${input_file##*/}"
    output_file="${output_file/%.jsonnet/.json}"
    output_file="${output_dir}/${output_file}"

    printf 'jsonnet -- "%s" >"%s"\n' "${input_file}" "${output_file}"
    jsonnet -- "${input_file}" >"${output_file}" || error=1
done

exit ${error}

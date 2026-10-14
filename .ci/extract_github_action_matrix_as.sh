#!/bin/sh
script_path="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

json="$(cat ${script_path}/images_matrix.json)"

if [ -z "$GITHUB_OUTPUT" ]; then
  echo "GITHUB_OUTPUT is not set. This script must run inside GitHub Actions." >&2
  exit 1
fi

{
  echo "matrix<<MATRIX_JSON_EOF"
  echo "$json"
  echo "MATRIX_JSON_EOF"
} >> "$GITHUB_OUTPUT"

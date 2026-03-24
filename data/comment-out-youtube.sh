#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="${1:-.}"

find "$ROOT_DIR" -type f -name "*.md" -print0 |
while IFS= read -r -d '' file; do
  perl -i -pe '
    s{^(\s*)(<youtube\b[^>]*></youtube>)(\s*)$}{$1<!-- $2 -->$3}g
  ' "$file"
done
#!/usr/bin/env bash

set -o pipefail

if ! which julia; then
  echo "Julia is not available in PATH"
  exit 1
fi

WAVI_ROOT=`pwd`

if ! head -n 1 README.md | grep -q WAVIhpc || [ ! -d "$WAVI_ROOT/.git" ]; then
  echo "We don't appear to be running in the root of the WAVIhpc repo, which is required"
  exit 1
fi

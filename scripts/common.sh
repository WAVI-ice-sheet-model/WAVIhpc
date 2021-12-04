#!/usr/bin/env bash

set -o pipefail

if ! which julia; then
  echo "Julia is not available in PATH"
  exit 1
fi

WAVI_ROOT=`pwd`
REPO_NAME=`git config -l | grep remote.origin.url | sed -r s'#^.+/([^/]+).git$#\1#'`

if [ "$REPO_NAME" != "WAVIhpc" ] || [ ! -d "$WAVI_ROOT/.git" ]; then
  echo "We don't appear to be running in the root of the WAVIhpc repo, which is required"
  exit 1
fi

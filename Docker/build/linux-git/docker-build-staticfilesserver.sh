#!/bin/sh
set -e

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"

docker build -t darkarchon/mare-synchronos-staticfilesserver:latest \
  -f "$REPO_ROOT/Docker/build/Dockerfile-MareSynchronosStaticFilesServer-git" \
  --no-cache --pull --force-rm \
  "$REPO_ROOT"

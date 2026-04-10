#!/usr/bin/env bash
# Check that no .env files are being committed
set -euo pipefail

env_files=$(git ls-files -- "*.env" "*.env.*" 2>/dev/null || true)
if [ -n "$env_files" ]; then
    echo "ERROR: .env files must not be committed:"
    echo "$env_files"
    exit 1
fi

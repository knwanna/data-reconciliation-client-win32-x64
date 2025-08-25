#!/usr/bin/env bash
set -euo pipefail

echo "===== Starting CI Validation ====="

# Ensure package.json exists
if [ ! -f package.json ]; then
  echo "ERROR: package.json not found."
  exit 2
fi

# Check main entry
MAIN_PATH=$(jq -r '.main // empty' package.json)
if [ -z "$MAIN_PATH" ]; then
  echo "WARNING: 'main' not defined in package.json (expected 'main.js')."
else
  if [ ! -f "$MAIN_PATH" ]; then
    echo "ERROR: main entry '$MAIN_PATH' does not exist."
    exit 3
  else
    echo "OK: main entry '$MAIN_PATH' exists."
  fi
fi

echo "===== CI Validation Passed (Icons Skipped) ====="

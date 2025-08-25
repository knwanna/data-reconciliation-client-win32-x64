#!/usr/bin/env bash
set -euo pipefail

echo "Validating package.json main and build icons..."

if [ ! -f package.json ]; then
  echo "ERROR: package.json not found."
  exit 2
fi

# require jq on runner; it's available on default Ubuntu/macOS runners
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

ICON_WIN=$(jq -r '.build.win.icon // empty' package.json)
ICON_MAC=$(jq -r '.build.mac.icon // empty' package.json)

if [ -n "$ICON_WIN" ]; then
  if [ ! -f "$ICON_WIN" ]; then
    echo "ERROR: Windows icon path '$ICON_WIN' not found."
    exit 4
  fi
fi

if [ -n "$ICON_MAC" ]; then
  if [ ! -f "$ICON_MAC" ]; then
    echo "ERROR: macOS icon path '$ICON_MAC' not found."
    exit 5
  fi
fi

echo "Validation passed."

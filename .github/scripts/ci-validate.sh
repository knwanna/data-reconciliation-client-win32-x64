#!/usr/bin/env bash
set -euo pipefail

echo "===== Starting CI Validation ====="

# --- Ensure package.json exists ---
if [ ! -f package.json ]; then
  echo "ERROR: package.json not found."
  exit 2
fi

# --- Check main entry ---
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

# --- Create build folder if missing ---
BUILD_DIR="build"
if [ ! -d "$BUILD_DIR" ]; then
  echo "Creating build directory..."
  mkdir -p "$BUILD_DIR"
fi

# --- Windows Icon ---
ICON_WIN=$(jq -r '.build.win.icon // empty' package.json)
if [ -n "$ICON_WIN" ]; then
  if [ ! -f "$ICON_WIN" ]; then
    echo "Windows icon '$ICON_WIN' not found. Generating default..."
    # Simple 1x1 ICO placeholder
    cat > "$ICON_WIN" <<EOL
00 00 01 00 01 00 10 10 00 00 01 00 04 00 28 01 00 00 16 00 00 00 28 00
00 00 10 00 00 00 10 00 00 00 01 00 04 00 00 00 00 00
EOL
    echo "Default Windows icon created at $ICON_WIN"
  else
    echo "OK: Windows icon exists."
  fi
fi

# --- macOS Icon ---
ICON_MAC=$(jq -r '.build.mac.icon // empty' package.json)
if [ -n "$ICON_MAC" ]; then
  if [ ! -f "$ICON_MAC" ]; then
    echo "macOS icon '$ICON_MAC' not found. Generating default..."
    # Empty placeholder
    touch "$ICON_MAC"
    echo "Default macOS icon created at $ICON_MAC"
  else
    echo "OK: macOS icon exists."
  fi
fi

# --- Linux Icon (optional) ---
ICON_LINUX=$(jq -r '.build.linux.icon // empty' package.json)
if [ -n "$ICON_LINUX" ]; then
  if [ ! -f "$ICON_LINUX" ]; then
    echo "Linux icon '$ICON_LINUX' not found. Generating default..."
    touch "$ICON_LINUX"
    echo "Default Linux icon created at $ICON_LINUX"
  else
    echo "OK: Linux icon exists."
  fi
fi

echo "===== CI Validation Passed ====="

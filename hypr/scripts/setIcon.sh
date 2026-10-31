#!/usr/bin/env bash

STATE_DIR="$HOME/.local/state/mellow-dots"
STATE_FILE="$STATE_DIR/icon.jpg"
STATE_FILE_HYPR="$HOME/.config/hypr/assets/icon/icon.jpg"

set -euo pipefail

mkdir -p "$STATE_DIR"

SELECTED=$(zenity --file-selection \
   --title="Choose your icon" \
   --filename="$STATE_DIR" \
   --file-filter="JPG images | *.jpg"
) || exit 0

if [ -z "$SELECTED" ]; then
    exit 0
fi

cp -- "$SELECTED" "$STATE_FILE"
cp -- "$SELECTED" "$STATE_FILE_HYPR"
quickshell kill
quickshell
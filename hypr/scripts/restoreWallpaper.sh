#!/usr/bin/env bash

STATE_FILE="$HOME/.local/state/mellow-dots/current-wallpaper"

set -euo pipefail

if [[ ! -f "$STATE_FILE" ]]; then
    exit 0
fi

WALLPAPER=$(<"$STATE_FILE")

if [[ ! -f "$WALLPAPER" ]]; then
    exit 0
fi

# Restore the wallpaper and its color palette
hyprctl hyprpaper wallpaper ",$WALLPAPER"
matugen image "$WALLPAPER" --source-color-index 0

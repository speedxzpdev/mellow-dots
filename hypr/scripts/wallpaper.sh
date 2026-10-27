
#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Wallpapers"
STATE_DIR="$HOME/.local/state/speeddot"
STATE_FILE="$STATE_DIR/current-wallpaper"

set -euo pipefail

mkdir -p "$WALLPAPER_DIR" "$STATE_DIR"

SELECTED=$(zenity --file-selection \
    --title="Choose a wallpaper" \
    --filename="$WALLPAPER_DIR/" \
    --file-filter="Images | *.png *.jpg *.jpeg *.PNG *.JPG *.JPEG" \
    2>/dev/null) || exit 0

if [ -z "$SELECTED" ]; then
    exit 0
fi

# Save the selected wallpaper
printf '%s\n' "$SELECTED" > "$STATE_FILE"

# Apply the wallpaper
hyprctl hyprpaper wallpaper ",$SELECTED"

# Generate the color palette
matugen image "$SELECTED" --source-color-index 0

# Reload Hyprland
hyprctl reload

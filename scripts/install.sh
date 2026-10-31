#!/usr/bin/env bash

set -euo pipefail

CONFIG_FOLDER="$HOME/.config"
MELLOW_FOLDER="$HOME/mellow-dots"
BACKUP_FOLDER="$HOME/.local/share/mellow-dots/backups/$(date +%Y%m%d_%H%M%S)"



echo ------------
echo -- Mellow --
echo ------------

mkdir -p "$CONFIG_FOLDER"
mkdir -p "$BACKUP_FOLDER"


install_dependencies() {
    echo "Installing dependencies..."

    sudo pacman -S --needed \
        zenity \
        matugen \
        fish \
        hyprpaper \
        starship \
        ttf-jetbrains-mono \
        quickshell \
        hyprlock

    echo "Dependencies installed!"
}

create_symlinks() {
    local name="$1"
    
    local src="$MELLOW_FOLDER/$name"
    local target="$CONFIG_FOLDER/$name"

    echo "SymLink => $name"

    if [[ ! -d "$src" ]]; then
        echo "Error: source directory not found: $src"
        return 1
    fi

    if [[ -L "$target" ]]; then
        ln -sfn "$src" "$target"

    elif [[ -e "$target" ]]; then
       mv -- "$target" "$BACKUP_FOLDER/$name"
       ln -s "$src" "$target"

    else
     ln -s "$src" "$target"
    fi
    
}

install_dependencies

for name in hypr fastfetch fish kitty matugen quickshell starship; do
create_symlinks $name 
done
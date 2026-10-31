#!/usr/bin/env bash

export QML_IMPORT_PATH="$HOME/mellow-dots/quickshell${QML_IMPORT_PATH:+:$QML_IMPORT_PATH}"
export QML2_IMPORT_PATH="$QML_IMPORT_PATH"

qs -p "$HOME/mellow-dots/quickshell"
#!/bin/bash

VSCODE_CONFIG_DIR="$DOTFILES_ROOT/.config/.vscode"
VSCODE_EXTENSIONS_DIR="$HOME/.vscode/extensions"
VSCODE_USER_DATA_DIR="$HOME/Library/Application Support/Code/User"

mkdir -p "$VSCODE_EXTENSIONS_DIR"
for extension in "$VSCODE_CONFIG_DIR"/extensions/*; do
    ln -sfn "$extension" "$VSCODE_EXTENSIONS_DIR"
done

mkdir -p "$VSCODE_USER_DATA_DIR"
ln -sfn "$VSCODE_CONFIG_DIR/settings.json" "$VSCODE_USER_DATA_DIR"

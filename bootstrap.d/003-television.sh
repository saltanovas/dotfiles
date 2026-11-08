#!/bin/bash

tv update-channels --force

source="$DOTFILES_ROOT/.config/television/cable"
target="$XDG_CONFIG_HOME/television/cable"

mkdir -p "$target"

for file in "$source"/*; do
    [ -e "$file" ] || [ -L "$file" ] || continue
    ln -sfn "$file" "$target"
done

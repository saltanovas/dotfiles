#!/bin/bash

mkdir -p "$HOME/.local/bin"
for file in "$DOTFILES_ROOT/.local/bin"/*; do
    [[ -f "$file" ]] || continue
    ln -sfn "$file" "$HOME/.local/bin/$(basename "$file")"
done

mkdir -p "$HOME/.local/share"
for folder in "$DOTFILES_ROOT/.local/share"/*; do
    [[ -d "$folder" ]] || continue
    ln -sfn "$folder" "$HOME/.local/share/$(basename "$folder")"
done

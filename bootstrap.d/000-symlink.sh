#!/bin/bash

. "$DOTFILES_ROOT/lib/utils.sh"

symlink() {
    local src="$1" dest="$2"

    if [[ -z "$src" || -z "$dest" ]]; then
        err "Source and destination must be provided to create a symlink."
        return 1
    fi

    if [[ ! -e "$src" ]]; then
        err "Cannot create a symlink, source does not exist: $src"
        return 1
    fi

    # -e follows symlinks and checks if the target exists; returns false for broken symlinks
    if [[ -e "$dest" ]]; then
        [[ "$(realpath "$src")" = "$(realpath "$dest")" ]] && return 0
        ohai "Destination already exists: $dest. Creating backup."
        backup "$dest"
    fi

    ln -sfn "$src" "$dest" || return 1
    ohai "Symlink created: $src -> $dest"
}

backup() {
    local target="$1"
    # Skips backup for broken symlinks as well
    [[ ! -e "$target" ]] && return 0

    local suffix=".bak"
    local backup="$target$suffix" i=1

    while [[ -e "$backup" ]]; do
        backup="$target$suffix.$((i++))"
    done

    mv "$target" "$backup"
}

ohai "Creating config symlinks..."

symlink "$DOTFILES_ROOT/.config/zsh/.zshenv" "$HOME" || exit 1
# Prettier walks upward all the way to filesystem root; no XDG file path support
symlink "$DOTFILES_ROOT/.config/prettier/.prettierrc.yaml" "$HOME"
symlink "$DOTFILES_ROOT/.config/jetbrains/.settings.json" "$HOME/Library/Application Support/JetBrains/Toolbox"

for config in .config/*; do
    folder=${config##*/}
    case "$folder" in
        "raycast") for file in "$DOTFILES_ROOT/$config"/*; do symlink "$file" "$HOME/$config"; done ;;
        *) symlink "$DOTFILES_ROOT/$config" "$HOME/$config" ;;
    esac
done

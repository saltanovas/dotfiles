#!/bin/bash

symlink() {
    local src="$1"
    local dest="$2"

    if [[ -z "$src" || -z "$dest" ]]; then
        err "Source and destination must be provided to create a symlink.";
        return 1
    fi

    if [[ ! -e "$src" ]]; then
        err "Cannot create a symlink, source does not exist: $src";
        return 1∏
    fi

    # -e follows symlinks and checks if the target exists; thus, this catch and override dangling symlinks
    if [[ ! -e "$dest" ]]; then
        ln -sf "$src" "$dest" || return 1
        ohai "Symlink created: $src -> $dest";
        return 0
    fi

    if [[ "$(realpath "$src")" = "$(realpath "$dest")" ]]; then return 0; fi

    err "Cannot create symlink, destination already exists: $src -> $dest"
}

ohai "Creating config symlinks..."

symlink "$DOTFILES_ROOT/.config/zsh/.zshenv" "$HOME" || exit 1

# Prettier walks upward all the way to filesystem root; no XDG file path support
symlink "$DOTFILES_ROOT/.config/.prettier/.prettierrc.yaml" "$HOME" || exit 1

symlink "$DOTFILES_ROOT/.config/.jetbrains/.settings.json" "$HOME/Library/Application Support/JetBrains/Toolbox"

for config in .config/*; do symlink "$DOTFILES_ROOT/$config" "$HOME/$config" || exit 1; done

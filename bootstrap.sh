#!/bin/bash

if [[ -z "$DOTFILES_ROOT" ]]; then
    printf "DOTFILES_ROOT environment variable is not set. Please set it to the root directory of the dotfiles repository."
    exit 1
fi

if [[ ! -d "$DOTFILES_ROOT" ]]; then
    printf "DOTFILES_ROOT is set to '%s', but this directory does not exist on the system." "$DOTFILES_ROOT"
    exit 1
fi

COLS="$(tput cols)"
if [ "$COLS" -le 0 ]; then
    COLS="${COLUMNS:-80}"
fi

# shellcheck disable=SC2120
hr() {
    for WORD in "${@:-#}"
    do
        printf '%*s' "$COLS" ' ' | sed "s/ /$WORD/g" | grep -o "^.\{$COLS\}"
    done
}

symlink() {
    local src="$1"
    local dest="$2"

    if [[ -z "$src" || -z "$dest" ]]; then
        err "Source and destination must be provided to create a symlink.";
        return 1
    fi

    if [[ ! -e "$src" ]]; then
        err "Cannot create a symlink, source does not exist: $src";
        return 1
    fi

    # -e follows symlinks and checks if the target exists; thus, this catch and override dangling symlinks
    if [[ ! -e "$dest" ]]; then
        ln -sf "$src" "$dest"
        ohai "Symlink created: $src -> $dest";
        return 0
    fi

    if [[ "$(realpath "$src")" = "$(realpath "$dest")" ]]; then return 0; fi

    err "Cannot create symlink, destination already exists: $src -> $dest"
}

hr

ohai "Creating config symlinks..."
symlink "$DOTFILES_ROOT/.config/zsh/.zshenv" "$HOME/.zshenv" || exit 1
for config in .config/*; do
    symlink "$DOTFILES_ROOT/$config" "$HOME/$config" || exit 1
done

hr

for script in "$DOTFILES_ROOT"/bootstrap.d/*.sh; do
    ./"$script" || exit 1
    hr
done

ohai "Dotfiles setup completed successfully! A reboot is a must for all changes to take effect."
if ask "Reboot now?"; then sudo reboot; else ohai "Reboot skipped."; fi

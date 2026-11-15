#!/bin/bash

DOTFILES_HOSTNAME="github.com"
DOTFILES_PATH="saltanovas/dotfiles.git"
DOTFILES_ROOT="$HOME/dotfiles"

ohai() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }

if [ ! -d "$DOTFILES_ROOT/.git" ]; then
    git clone --quiet "https://${DOTFILES_HOSTNAME}/${DOTFILES_PATH}" "$DOTFILES_ROOT" || exit
else
    git -C "$DOTFILES_ROOT" merge --quiet origin/HEAD || exit
fi

. "$DOTFILES_ROOT/.config/shell/xdg.sh"
. "$DOTFILES_ROOT/.config/shell/env.sh"
. "$DOTFILES_ROOT/.config/shell/path.sh"

for script in bootstrap.d/*.sh; do
    ./"$script" || exit
done

ohai "Dotfiles setup completed successfully! A reboot is a must for all changes to take effect."

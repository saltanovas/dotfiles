#!/bin/bash

DOTFILES_HOSTNAME="github.com"
DOTFILES_PATH="saltanovas/dotfiles.git"
DOTFILES_ROOT="$HOME/.dotfiles"

# String formatters
if [ -t 1 ]; then _tty_escape() { printf '\033[%sm' "$1"; } else _tty_escape() { :; }; fi
tty_reset="$(_tty_escape '0')"
tty_bold="$(_tty_escape '1')"
tty_blue="$(_tty_escape '1;34')"
tty_red="$(_tty_escape '1;31')"

# Logging
ohai() { printf "%b==>%b %s%b\n" "$tty_blue" "$tty_bold" "$@" "$tty_reset"; }
abort() {
    printf "%bError:%b %s\n" "$tty_red" "$tty_reset" "$1" >&2
    [ "$#" -gt 1 ] && shift && printf "%s\n" "$@" >&2
    exit 1
}

if [ ! -d "$DOTFILES_ROOT" ]; then
    ohai "Dotfiles repository is not found. Initializing..."
    git clone "https://${DOTFILES_HOSTNAME}/${DOTFILES_PATH}" "$DOTFILES_ROOT" >/dev/null
    ohai "Dotfiles repository initialized at $DOTFILES_ROOT"
    exec "$DOTFILES_ROOT/bootstrap.sh"
    exit 0
fi

ohai "Dotfiles directory is found at $DOTFILES_ROOT..."

if [ ! -d "$DOTFILES_ROOT/.git" ]; then
    abort "Dotfiles directory is not a git repository."
fi

if output=$(git -C "$DOTFILES_ROOT" config --get remote.origin.url 2>&1); then
    if [[ "$output" != *"$DOTFILES_HOSTNAME"[:/]"$DOTFILES_PATH" ]]; then
        abort "Dotfiles directory points to an unexpected remote repository." \
        "Expected: ${DOTFILES_HOSTNAME}[:/]${DOTFILES_PATH}" \
        "Actual: $output"
    fi
else
    abort "Failed to get a remote URL of dotfiles repository: $output";
fi

ohai "Updating..."
git -C "$DOTFILES_ROOT" merge origin/HEAD >/dev/null || abort "Update failed."
ohai "Update completed."

exec "$DOTFILES_ROOT/bootstrap.sh"

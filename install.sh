#!/bin/bash

# Strict mode
set -e          # exit on any command failure
set -u          # error on undefined variables
set -o pipefail # pipelines fail on first error

# String formatters
tty_escape() { [ -t 1 ] && printf '\033[%sm' "$1"; }
tty_mkbold() { tty_escape "1;$1"; }
tty_reset="$(tty_escape 0)"
tty_bold="$(tty_mkbold 39)"
tty_blue="$(tty_mkbold 34)"
tty_red="$(tty_mkbold 31)"

# Logging
ohai() { printf "${tty_blue}==>${tty_bold} %s${tty_reset}\n" "$1"; }
warn()  { printf "${tty_red}Warning:${tty_reset} %s\n" "$1" >&2; }
abort() { printf "%s\n" "$@" >&2; exit 1; }


ohai "Installing Homebrew..."
if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

case "$(/usr/bin/uname -m)" in
    arm64) eval "$(/opt/homebrew/bin/brew shellenv)" ;;
    *) eval "$(/usr/local/bin/brew shellenv)" ;;
esac

ohai "Installing Homebrew packages..."
brew bundle
brew cleanup
ohai "Homebrew packages installed successfully."

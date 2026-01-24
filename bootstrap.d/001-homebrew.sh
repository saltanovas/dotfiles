#!/bin/bash

set -euo pipefail

. "$DOTFILES_ROOT/lib/utils.sh"

BREWFILE="$(realpath "../.config/homebrew/Brewfile")"
HOMEBREW_PREFIX=$(
    case "$(uname)" in
        Darwin)
            case "$(uname -m)" in
                arm64) prefix="/opt/homebrew" ;;
                *) prefix="/usr/local" ;;
            esac
        ;;
        Linux) prefix="/home/linuxbrew/.linuxbrew" ;;
        *) abort "Homebrew is only supported on macOS and Linux." ;;
    esac

    echo "$prefix"
)

brew() { HOMEBREW_NO_AUTO_UPDATE=1 "$HOMEBREW_PREFIX/bin/brew" "$@"; }

if [[ ! -x "$HOMEBREW_PREFIX/bin/brew" ]]; then
    ohai "Setting up Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # See: https://docs.brew.sh/Manpage#bundle-subcommand
    ohai "Installing Homebrew formulae listed in the $BREWFILE..."
    brew bundle --file="$BREWFILE"

    ohai "Homebrew setup completed."

    exit 0
fi

brew update

# See: https://docs.brew.sh/Manpage#upgrade-options-installed_formulainstalled_cask-
ohai "Upgrading installed Homebrew formulae..."
brew upgrade
ohai "Upgrade completed."

# See: https://docs.brew.sh/Manpage#cleanup-options-formulacask-
ohai "Removing old versions of installed Homebrew formulae..."
brew cleanup
ohai "Cleanup completed."

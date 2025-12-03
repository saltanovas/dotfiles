#!/bin/bash

set -euo pipefail

source ./utils.sh

BREWFILE="$(realpath "../.config/homebrew/Brewfile")"
HOMEBREW_BIN=$(
    case "$(uname)" in
        Darwin)
            case "$(uname -m)" in
                arm64) HOMEBREW_PREFIX="/opt/homebrew" ;;
                *) HOMEBREW_PREFIX="/usr/local" ;;
            esac
        ;;
        Linux) HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew" ;;
        *) abort "Homebrew is only supported on macOS and Linux." ;;
    esac

    printf "%s/bin/brew" "$HOMEBREW_PREFIX"
)

brew() { HOMEBREW_NO_AUTO_UPDATE=1 "$HOMEBREW_BIN" "$@"; }

brew_bundle() {
    [ -n "$1" ] && local cmd=" $1"

    if [ $# -gt 0 ]; then
        shift
        local flags="$*"
        [ -n "$flags" ] && flags=" $flags"
    fi

    printf "${tty_blue}%s${tty_reset}" "brew bundle$cmd$flags --file=\"${BREWFILE/$HOME/\$HOME}\"";
}

if [[ ! -x "$HOMEBREW_BIN" ]]; then
    ohai "Setting up Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # See: https://docs.brew.sh/Manpage#bundle-subcommand
    ohai "Installing Homebrew formulae listed in the $BREWFILE..."
    brew bundle --file="$BREWFILE"

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

ohai "Done. You may now perform optional actions if needed:"
echo "- List Brewfile formulae not present on the system: $(brew_bundle check)"
echo "- Install Brewfile formulae not present on the system: $(brew_bundle)"
echo "- List installed formulae that are not present in the Brewfile: $(brew_bundle cleanup)"
echo "- Uninstall formulae that are not present in the Brewfile: $(brew_bundle cleanup --force)"

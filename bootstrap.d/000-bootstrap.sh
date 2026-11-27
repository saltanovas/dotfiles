#!/usr/bin/env bash

iswrk() {
    if type -P iswrk >/dev/null 2>&1; then
        command iswrk
    else
        profiles status -type enrollment 2>/dev/null | grep -q '^Enrolled via DEP: Yes'
    fi
}

isadmin() {
    for group in $(id -Gn); do
        case "$group" in
            admin | sudo | wheel) return 0 ;;
        esac
    done
    return 1
}

mkbrewfile() {
    local configpath="$XDG_CONFIG_HOME/homebrew"
    if iswrk; then
        cat "$configpath/Brewfile.p" "$configpath/Brewfile.w" | \
            grep -v '^[[:space:]]*$' | \
            grep -v '^[[:space:]]*#' | \
            sort | \
            uniq -u \
            > "$HOMEBREW_BUNDLE_FILE"
    else 
        cp "$configpath/Brewfile.p" "$HOMEBREW_BUNDLE_FILE"
    fi
}

if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    if isadmin; then
        NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || exit $?
    else
        mkdir -p "$HOME/opt/homebrew"
        git clone --depth=1 https://github.com/Homebrew/brew "$HOME/opt/homebrew" >/dev/null || exit $?
    fi
fi

echo "Installing Homebrew formulae listed in the $HOMEBREW_BUNDLE_FILE"
mkbrewfile
brew bundle --verbose
echo "Homebrew installation completed."

dotbot -c "$DOTFILES_ROOT/install.json"

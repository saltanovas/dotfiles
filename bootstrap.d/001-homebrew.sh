#!/bin/bash

. "$DOTFILES_ROOT/lib/utils.sh"

isadmin() {
	for group in $(id -Gn); do
		case "$group" in
		admin | sudo | wheel) return 0 ;;
		esac
	done
	return 1
}

mkbrewfile() {
	local configpath="$HOME/.config/homebrew"
	cat "$configpath/Brewfile.p" "$configpath/Brewfile.w" | \
		grep -v '^[[:space:]]*$' | \
		grep -v '^[[:space:]]*#' | \
		sort | \
		uniq -u \
		> "$HOMEBREW_BUNDLE_FILE"

	chmod 444 "$HOMEBREW_BUNDLE_FILE"
}

if ! command -v brew >/dev/null 2>&1; then
	ohai "Installing Homebrew..."
	if isadmin; then
		NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || exit $?
	else
		mkdir -p "$HOME/opt/homebrew"
		git clone --depth=1 https://github.com/Homebrew/brew "$HOME/opt/homebrew" >/dev/null || exit $?
	fi
fi

ohai "Installing Homebrew formulae listed in the $HOMEBREW_BUNDLE_FILE"
mkbrewfile
brew bundle

ohai "Homebrew installation completed."

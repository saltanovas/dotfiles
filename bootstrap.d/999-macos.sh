#!/usr/bin/env bash

OSX_CONFIG="$DOTFILES_ROOT/.config/osx"

[ "$(uname)" = "Darwin" ] || exit 0

# Close any open System Preferences panes to prevent them from overriding settings we are about to change
osascript -e 'tell application "System Preferences" to quit'

echo "Configuring macOS settings..."

if ! ls "$HOME/Library/Mail" &>/dev/null; then
    printf "%s\n\n" "⚠️ Full Disk Access is required"
    gum confirm $'System Settings will open to Full Disk Access.\n'$'Grant access to your terminal app, then run this script again.' || exit
    open "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles" && exit
fi

"$OSX_CONFIG/apps/init.sh"

"$OSX_CONFIG/hid/init.sh"

"$OSX_CONFIG/keymap/init.sh"
"$OSX_CONFIG/input.sh"
"$OSX_CONFIG/sound.sh"

"$OSX_CONFIG/appearance.sh"
"$OSX_CONFIG/menubar.sh"
"$OSX_CONFIG/dock.sh"
"$OSX_CONFIG/hotcorners.sh"

"$OSX_CONFIG/finder.sh"
"$OSX_CONFIG/desktop.sh"
"$OSX_CONFIG/lockscreen.sh"

"$OSX_CONFIG/missioncontrol.sh"
"$OSX_CONFIG/windowmanager.sh"

echo "macOS configuration has completed successfully."

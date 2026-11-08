#!/bin/bash

[ "$(uname)" = "Darwin" ] || exit 0

# Close any open System Preferences panes to prevent them from overriding settings we are about to change
osascript -e 'tell application "System Preferences" to quit'

ohai "Configuring macOS settings..."

if ! ls "$HOME/Library/Mail" &>/dev/null; then
    ohai "⚠️ Full Disk Access is required"
    gum confirm $'System Settings will open to Full Disk Access.\n'$'Grant access to your terminal app, then run this script again.' || abort "Operation aborted."
    open "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles" && exit
fi

./apps/init.sh

./hid/init.sh

./keymap/init.sh
./input.sh
./sound.sh

./appearance.sh
./menubar.sh
./dock.sh
./hotcorners.sh

./finder.sh
./desktop.sh
./lockscreen.sh

./missioncontrol.sh
./windowmanager.sh

./sleep.sh

ohai "macOS configuration has completed successfully."

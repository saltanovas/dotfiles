#!/bin/bash

set -euo pipefail

. "$DOTFILES_ROOT/lib/utils.sh"

[ "$(uname)" = "Darwin" ] || exit 0

# Close any open System Preferences panes to prevent them from overriding settings we are about to change
osascript -e 'tell application "System Preferences" to quit'

ohai "Configuring macOS settings..."

if ! ls "$HOME/Library/Mail" &>/dev/null; then
    ohai "⚠️ Full Disk Access is required"
    ack "Terminal window is going to be closed and System Settings will open." \
        "Once the access is granted, run the script again." || abort "Operation aborted."
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

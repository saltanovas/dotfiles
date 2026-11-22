#!/bin/bash

SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)" || exit 1

# Enable natural scrolling | Mimics touch devices
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
# Double click speed for mouse and trackpad
defaults write NSGlobalDomain com.apple.mouse.doubleClickThreshold -float 1.1

"$SCRIPT_DIR/mouse.sh"
"$SCRIPT_DIR/trackpad.sh"
"$SCRIPT_DIR/keyboard.sh"

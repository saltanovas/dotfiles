#!/bin/bash

set -euo pipefail

# FIXME: Not quite sure where to keep these global settings below, as they affect multiple HID devices
# Enable natural scrolling | Mimics touch devices
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
# Double click speed | Affects both mouse and trackpad
defaults write NSGlobalDomain com.apple.mouse.doubleClickThreshold -float 1.1

./mouse.sh
./trackpad.sh
./keyboard.sh

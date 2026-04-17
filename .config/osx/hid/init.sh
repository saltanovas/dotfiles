#!/bin/bash

# Enable natural scrolling | Mimics touch devices
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
# Double click speed for mouse and trackpad
defaults write NSGlobalDomain com.apple.mouse.doubleClickThreshold -float 1.1

./mouse.sh
./trackpad.sh
./keyboard.sh

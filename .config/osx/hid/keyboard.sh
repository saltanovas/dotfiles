#!/bin/bash

set -euo pipefail

# Key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
# Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 25
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Enable Keyboard navigation with Tab
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

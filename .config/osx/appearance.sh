#!/bin/bash

set -euo pipefail

# Set dark mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Disable tint window background
defaults write NSGlobalDomain AppleReduceDesktopTinting -bool false

# Show scrollbars only when scrolling
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Set sidebar icon size
# Affects sidebars on Finder, System Settings etc.
# 1 = small | 2 = medium | 3 = large
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

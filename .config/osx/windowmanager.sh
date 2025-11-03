#!/bin/bash

set -euo pipefail

# Enable dragging windows to screen edges to tile them
defaults write com.apple.WindowManager EnableTilingByEdgeDrag -bool true
# Enable dragging windows to the menu bar to fill the screen
defaults write com.apple.WindowManager EnableTopTilingByEdgeDrag -bool true
# Enable holding Option key to tile windows
defaults write com.apple.WindowManager EnableTilingOptionAccelerator -bool true
# Disable margins for tiles windows
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false

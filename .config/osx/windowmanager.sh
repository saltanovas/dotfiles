#!/bin/bash

set -euo pipefail

# Prefer tabs only in full screen
# 1. always | 2. manual (Never) | 3. fullscreen
defaults write NSGlobalDomain AppleWindowTabbingMode -string fullscreen
# Never restore windows or tabs when reopening apps after quit
# Note: this does not affect the macOS "Reopen windows when logging back in" feature
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
# Always ask to keep changes when closing documents
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -bool true

# Enable dragging windows to screen edges to tile them
defaults write com.apple.WindowManager EnableTilingByEdgeDrag -bool true
# Enable dragging windows to the menu bar to fill the screen
defaults write com.apple.WindowManager EnableTopTilingByEdgeDrag -bool true
# Enable holding Option key to tile windows
defaults write com.apple.WindowManager EnableTilingOptionAccelerator -bool true
# Disable margins for tiles windows
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false

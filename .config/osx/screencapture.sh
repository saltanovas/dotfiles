#!/bin/bash

set -euo pipefail

# ========== Screencapture ==========
mkdir -p "$HOME/Desktop/ss" && defaults write com.apple.screencapture location -string "$HOME/Desktop/ss"
#defaults write com.apple.screencapture name -string "Screenshot"
defaults write com.apple.screencapture include-date -bool true
defaults write com.apple.screencapture show-thumbnail -bool true

# ========== Screenshot ==========
# Other options: jpg, pdf, psd, gif, tga, tiff, bmp, heic
defaults write com.apple.screencapture type -string png
# Disables border shadows for screenshots
defaults write com.apple.screencapture disable-shadow -bool true

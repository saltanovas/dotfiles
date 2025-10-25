#!/bin/bash

set -euo pipefail

defaults write com.apple.screencapture name -string "Screenshot"
defaults write com.apple.screencapture include-date -bool true
# Other options: jpg, pdf, psd, gif, tga, tiff, bmp, heic
defaults write com.apple.screencapture type -string png
defaults write com.apple.screencapture disable-shadow -bool false
mkdir "$HOME/Desktop/s" && defaults write com.apple.screencapture location -string "~/Desktop/s"
defaults write com.apple.screencapture show-thumbnail -bool true

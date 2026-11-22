#!/bin/bash

# ========== Screencapture ==========
if [ "$(sw_vers -productVersion | cut -d. -f1)" -ge 27 ]; then
    screenshot_key=location-screenshot
else
    screenshot_key=location
fi
defaults write com.apple.screencapture "$screenshot_key" -string "~/s"
#defaults write com.apple.screencapture name -string "Screenshot"
defaults write com.apple.screencapture include-date -bool true
defaults write com.apple.screencapture show-thumbnail -bool true

# ========== Screenshot ==========
# Other options: jpg, pdf, psd, gif, tga, tiff, bmp, heic
defaults write com.apple.screencapture type -string png
# Disables border shadows for screenshots
defaults write com.apple.screencapture disable-shadow -bool true

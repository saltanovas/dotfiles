#!/bin/bash

set -euo pipefail

defaults write NSGlobalDomain com.apple.sound.beep.sound -string "/System/Library/Sounds/Tink.aiff"
defaults write NSGlobalDomain com.apple.sound.beep.volume -float 1.0

# Enable user interface sound effects (e.g. taking screenshots, emptying the Bin etc.)
defaults write NSGlobalDomain com.apple.sound.uiaudio.enabled -bool true
# Disable screen flash when an alert sound occurs
defaults write NSGlobalDomain com.apple.sound.beep.flash -int 0
# Disable the feedback when changing volume
defaults write NSGlobalDomain com.apple.sound.beep.feedback -int 0

# The following disables the sound on startup
# sudo nvram SystemAudioVolume=""

#!/bin/bash

set -euo pipefail

# ========================================
# Touchbar
# ========================================
# Global Touch Bar appearance
defaults write com.apple.touchbar.agent PresentationModeGlobal -string "appWithControlStrip"

# Defines the behaviour of PresentationModeGlobal on Fn key press
# While only the one matching PresentationModeGlobal applies, other entries act as default values
# Possible values: app, fullControlStrip, functionKeys, workflows, spaces
defaults write com.apple.touchbar.agent PresentationModeFnModes -dict \
    "app" -string "functionKeys" \
    "appWithControlStrip" -string "functionKeys" \
    "fullControlStrip" -string "functionKeys" \
    "functionKeys" -string "functionKeys" \
    "workflows" -string "functionKeys" \
    "workflowsWithControlStrip" -string "functionKeys" \
    "spaces" -string "functionKeys" \
    "spacesWithControlStrip" -string "functionKeys"

# Key is bundle id of the app (e.g. "org.alacritty")
# To find the bundle id, use: osascript -e 'id of app "AppName"'
defaults write com.apple.touchbar.agent PresentationModePerApp -dict

# ========================================
# Control Strip
# ========================================
defaults write com.apple.controlstrip MiniCustomized -array \
    "com.apple.system.brightness" \
    "com.apple.system.volume" \
    "com.apple.system.media-play-pause" \
    "com.apple.system.night-shift"

defaults write com.apple.controlstrip FullCustomized -array \
    "com.apple.system.group.brightness" \
    "com.apple.system.mission-control" \
    "com.apple.system.launchpad" \
    "com.apple.system.group.keyboard-brightness" \
    "com.apple.system.group.media" \
    "com.apple.system.group.volume" \
    "com.apple.system.show-desktop"

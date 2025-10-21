#!/bin/bash

set -euo pipefail

# ========================================
# Touchbar
# ========================================
# 1. app = App Controls
# 2. appWithControlStrip = App Controls + Mini Control Strip
# 3. fullControlStrip = Expanded Control Strip
# 4. functionKeys = F1, F2 etc. Keys
# 5. workflows = Quick Actions
# 6. workflowsWithControlStrip = Quick Actions + Mini Control Strip
# 7. spaces = Spaces
# 8. spacesWithControlStrip = Spaces + Mini Control Strip
defaults write com.apple.touchbar.agent PresentationModeGlobal -string "appWithControlStrip"

# Defines the behavior of the Fn key
# Yes, it accepts a dictionary, while other values act as default values once PresentationModeGlobal is changed
# Values: app, fullControlStrip, functionKeys, workflows, spaces
defaults write com.apple.touchbar.agent PresentationModeFnModes -dict \
    "appWithControlStrip" -string "functionKeys"

# Key is app id (e.g. "org.alacritty")
defaults write com.apple.touchbar.agent PresentationModePerApp -dict \


# ========================================
# Control Strip appearance
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

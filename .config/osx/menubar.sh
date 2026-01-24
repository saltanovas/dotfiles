#!/bin/bash

set -euo pipefail

# Hide menu bar in full screen
defaults write NSGlobalDomain AppleMenuBarVisibleInFullscreen -bool false

# Hide Spotlight
defaults -currentHost write com.apple.Spotlight MenuItemHidden -bool true
# Hide Siri
defaults -currentHost write com.apple.Siri StatusMenuVisible -bool false
# Show Input Menu
defaults write com.apple.TextInputMenu visible -bool true

# Show Battery in Menu Bar & hide it in Control Center
defaults -currentHost write com.apple.controlcenter Battery -int 6
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true
defaults -currentHost write com.apple.controlcenter BatteryShowEnergyMode -bool true

# Show when active
defaults -currentHost write com.apple.controlcenter FocusModes -int 2
defaults -currentHost write com.apple.controlcenter ScreenMirroring -int 2

# Clock
defaults write com.apple.menuextra.clock IsAnalog -bool false
defaults write com.apple.menuextra.clock ShowAMPM -bool false
# 0 = When Space Allows | 1 = Always | 2 = Never
defaults write com.apple.menuextra.clock ShowDate -int 1
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
defaults write com.apple.menuextra.clock ShowSeconds -bool true
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

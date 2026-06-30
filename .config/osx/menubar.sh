#!/bin/bash

# Hide menu bar in full screen
defaults write NSGlobalDomain AppleMenuBarVisibleInFullscreen -bool false

# ========== Menu bar items ==========
# Hide
defaults -currentHost write com.apple.Spotlight MenuItemHidden -bool true
defaults -currentHost write com.apple.Siri StatusMenuVisible -bool false
# Disable
defaults -currentHost write com.apple.controlcenter Sound -int 8
defaults -currentHost write com.apple.controlcenter NowPlaying -int 8
defaults -currentHost write com.apple.controlcenter Display -int 8
# Show in Control Center only
defaults remove com.apple.controlcenter "NSStatusItem Preferred Position Bluetooth" 2>/dev/null
defaults write com.apple.controlcenter "NSStatusItem VisibleCC Bluetooth" -bool false
defaults -currentHost write com.apple.controlcenter Bluetooth -int 24
# Show
defaults write com.apple.TextInputMenu visible -bool true

# ========== Clock ==========
defaults write com.apple.menuextra.clock IsAnalog -bool false
defaults write com.apple.menuextra.clock ShowAMPM -bool false
# 0 = When Space Allows | 1 = Always | 2 = Never
defaults write com.apple.menuextra.clock ShowDate -int 1
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
defaults write com.apple.menuextra.clock ShowSeconds -bool true
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

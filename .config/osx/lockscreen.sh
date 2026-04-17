#!/bin/bash

# ========================================
# Login window
# ========================================
# Clock
defaults write com.apple.loginwindow UsesLargeDateTime -bool true
defaults write com.apple.loginwindow ClockFontIdentifier -string soft
defaults write com.apple.loginwindow ClockFontWeight -int 400
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true

defaults write com.apple.loginwindow HideUserAvatarAndName -bool false
defaults write com.apple.loginwindow LoginwindowText ""
# Disable password hints
defaults write com.apple.loginwindow RetriesUntilHint -int 0
# Show the Sleep, Restart, and Shut Down buttons
defaults write com.apple.loginwindow PowerOffDisabled -bool false

# ========================================
# Screen saver
# ========================================
defaults write com.apple.screensaver idleTime -int 600
defaults write com.apple.screensaver showClock -bool true
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

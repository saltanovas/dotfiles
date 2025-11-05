#!/bin/bash

set -euo pipefail

# ========================================
# Login window
# ========================================
# Show large clock
defaults write /Library/Preferences/com.apple.loginwindow UsesLargeDateTime -bool true
# Show 24-hour time
sudo defaults write /Library/Preferences/.GlobalPreferences AppleICUForce24HourTime -bool true
# Show username and photo
sudo defaults write /Library/Preferences/com.apple.loginwindow HideUserAvatarAndName -bool false
# Disable password hints
sudo defaults write /Library/Preferences/com.apple.loginwindow RetriesUntilHint -int 0
# Disable message
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText ""
# Show the Sleep, Restart, and Shut Down buttons
sudo defaults write /Library/Preferences/com.apple.loginwindow PowerOffDisabled -bool false

# ========================================
# Screen saver
# ========================================
defaults write com.apple.screensaver idleTime -int 600
defaults write com.apple.screensaver showClock -bool true
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

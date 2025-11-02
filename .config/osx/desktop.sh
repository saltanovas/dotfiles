#!/bin/bash

set -euo pipefail

# Enable click wallpaper to reveal desktop
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool true

# Hide desktop items
defaults write com.apple.WindowManager StandardHideDesktopIcons -bool true
# Hide desktop widgets
defaults write com.apple.WindowManager StandardHideWidgets -bool true
# Hide Volume icons
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Decrease grid spacing
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 43" ~/Library/Preferences/com.apple.finder.plist
# Decrease icon size
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 60" ~/Library/Preferences/com.apple.finder.plist
# Enable snap-to-grid
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# Show icon previews
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showIconPreview true" ~/Library/Preferences/com.apple.finder.plist

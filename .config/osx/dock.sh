#!/bin/bash

set -euo pipefail

defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock orientation -string "bottom"

# Never show Dock
defaults write com.apple.dock autohide -bool true
# Disable autohide delay
defaults write com.apple.dock autohide-delay -float 0
# Set the autohide/show animation duration
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Animate opening applications (app icon bounces in the Dock)
defaults write com.apple.dock launchanim -bool true
# Minimise windows using: genie, scale
defaults write com.apple.dock mineffect -string "genie"
# Never minimize windows into application icon
defaults write com.apple.dock minimize-to-applications -bool false
# Double click a window's title bar to: Fill, Zoom, Minimize, None
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "Zoom"

# Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true
# Disable suggested and recent apps in Dock
defaults write com.apple.dock show-recents -bool false
# Disable translucent Dock icons of hidden applications
defaults write com.apple.dock showhidden -bool false

# Add desired apps to the Dock
defaults write com.apple.dock persistent-apps -array ""
for dockItem in /Applications/{"Google Chrome","Visual Studio Code","IntelliJ IDEA Ultimate","GoLand","DataGrip","Spotify","Notion"}.app; do
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>'"$dockItem"'</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
done

# Add Downloads folder to the Dock
defaults write com.apple.dock persistent-others -array-add \
'<dict>
    <key>tile-data</key>
    <dict>
        <key>file-data</key>
        <dict><key>_CFURLString</key><string>file://'"$HOME"'/Downloads/</string><key>_CFURLStringType</key><integer>15</integer></dict>
        <key>arrangement</key><integer>2</integer>
        <key>displayas</key><integer>1</integer>
        <key>file-label</key><string>Downloads</string>
        <key>file-type</key><integer>2</integer>
        <key>showas</key><integer>1</integer>
    </dict>
    <key>tile-type</key><string>directory-tile</string>
</dict>'

#!/bin/bash

# ========================================
# Dock
# ========================================
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock orientation -string "bottom"

defaults write com.apple.dock autohide -bool true
# Disable autohide delay
defaults write com.apple.dock autohide-delay -float 0
# Set the autohide/show animation duration
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Animate opening applications (app icon bounces in the Dock)
defaults write com.apple.dock launchanim -bool true
# Minimise windows using: genie, scale
defaults write com.apple.dock mineffect -string "genie"
# Don't minimize windows into application icon
defaults write com.apple.dock minimize-to-applications -bool false
# Double click a window's title bar to: Fill, Zoom, Minimize, None
defaults read -g AppleActionOnDoubleClick -string "Zoom"

# Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true
# Disable suggested and recent apps in Dock
defaults write com.apple.dock show-recents -bool false
# Disable translucent Dock icons of hidden applications
defaults write com.apple.dock showhidden -bool false

# Remove all app icons from the Dock
defaults write com.apple.dock persistent-apps -array ""
# Add desired apps to the Dock
for dockItem in /Applications/{"Google Chrome","Visual Studio Code","IntelliJ IDEA Ultimate","GoLand","DataGrip","Spotify","Notion"}.app; do
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>'$dockItem'</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
done
# Add Downloads folder to the Dock
defaults write com.apple.dock persistent-others -array-add \
'<dict>
    <key>tile-data</key>
    <dict>
        <key>file-data</key>
        <dict><key>_CFURLString</key><string>file:///Users/saltanovas/Downloads/</string><key>_CFURLStringType</key><integer>15</integer></dict>
        <key>arrangement</key><integer>2</integer>
        <key>displayas</key><integer>1</integer>
        <key>file-label</key><string>Downloads</string>
        <key>file-type</key><integer>2</integer>
        <key>showas</key><integer>1</integer>
    </dict>
    <key>tile-type</key><string>directory-tile</string>
</dict>'

# ========================================
# Input
# ========================================
# ===== Autocorrect =====
# Disable auto-correct spelling
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable auto-period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable full stop with double-space
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false
# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# ===== Dictation =====
# Disable dictation
defaults write com.apple.HIToolbox AppleDictationAutoEnable -bool false
# ===== Input Sources =====
# Show Input menu in menu bar
defaults write com.apple.TextInputMenu visible -bool true
# Enable per-context input source switching (each app keeps its own active keyboard layout)
defaults write com.apple.HIToolbox AppleGlobalTextInputProperties -dict TextInputGlobalPropertyPerContextInput -bool true
# Remove all input sources
defaults delete com.apple.HIToolbox AppleEnabledInputSources
# Add ABC input source
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
"<dict>
    <key>InputSourceKind</key><string>Keyboard Layout</string>
    <key>KeyboardLayout ID</key><integer>252</integer>
    <key>KeyboardLayout Name</key><string>ABC</string>
</dict>"
# Add Lithuanian input source
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
"<dict>
    <key>InputSourceKind</key><string>Keyboard Layout</string>
    <key>KeyboardLayout ID</key><integer>30761</integer>
    <key>KeyboardLayout Name</key><string>Lithuanian</string>
</dict>"

# ========================================
# Clock
# ========================================
defaults write -g AppleICUForce24HourTime -bool true
defaults write com.apple.menuextra.clock IsAnalog -bool false
defaults write com.apple.menuextra.clock ShowAMPM -bool false
# 0 = When Space Allows, 1 = Always, 2 = Never
defaults write com.apple.menuextra.clock ShowDate -int 1
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
defaults write com.apple.menuextra.clock ShowSeconds -bool true
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

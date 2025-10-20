#!/bin/bash

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

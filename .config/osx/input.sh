#!/bin/bash

# ========== Autocorrect ==========
# Disable auto-correct spelling
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable auto-period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable full stop with double-space
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false
# Disable smart quote substitution
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable smart dashe substitution
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Disable text completion
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticTextCompletionCollapsed -bool false
# Disable inline text prediction
defaults write NSGlobalDomain NSAutomaticInlinePredictionEnabled -bool false
# Enable automatic spelling check by language
defaults write NSGlobalDomain NSSpellCheckerAutomaticallyIdentifiesLanguages -bool true

# ========== Dictation ==========
# Disable dictation
defaults write com.apple.HIToolbox AppleDictationAutoEnable -bool false

# ========== Input Sources ==========
# Disable input source indicator popup
defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled 0
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

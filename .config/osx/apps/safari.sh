#!/bin/bash

defaults write com.apple.Safari HomePage -string "about:blank"
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

defaults write com.apple.Safari SearchProviderShortName -string "Google"
defaults write com.apple.Safari PrivateSearchEngineUsesNormalSearchEngineToggle -bool true

defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

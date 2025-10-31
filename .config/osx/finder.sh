#!/bin/bash

set -euo pipefail

# Enable quit the Finder
defaults write com.apple.finder QuitMenuItem -bool true

# ========== Desktop =========
# Hide Volumes icons from Desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# ========== Bin ==========
# Disable the warning before emptying the Bin
defaults write com.apple.finder WarnOnEmptyTrash -bool false
# Remove items from the Bin after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

# ========== Files ==========
# Show filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show the ~/Library folder
chflags nohidden ~/Library
# Show the /Volumes folder
chflags nohidden /Volumes

# ========== Window ==========
# Set Desktop as the default location for new windows
# For other paths, use `PfLo` and `NewWindowTargetPath "file://<path>/"`
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other        : `PfLo`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
# Show full POSIX path as window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Disable delay when showing the window title icon
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

# ========== Sidebar ==========
# Note: icon size on the sidebar is controlled globally inside appearance settings, see `NSTableViewDefaultSizeMode`
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder SidebarWidth -int 196
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowRecentTags -bool false

# ========== View & Search ==========
# Always open everything in icon view
# `icnv` = Icon | `Nlsv` = List | `clmv` = Column | `glyv` = Gallery
defaults write com.apple.Finder FXPreferredViewStyle icnv
# Show folders at the top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# When performing a search, search the current folder by default
# `SCcf` = current folder | `SCev` = this mac | `SCsp` = previous search scope
defaults write com.apple.finder FXDefaultSearchScope -string SCcf
# Expand/Shrink "Get Info" panes
defaults write com.apple.finder FXInfoPanesExpanded -dict \
General -bool true \
MetaData -bool true \
OpenWith -bool true \
Preview -bool false \
Privileges -bool false \

#!/bin/bash

set -euo pipefail

# Enable quit the Finder
defaults write com.apple.finder QuitMenuItem -bool true

# ========== Bin ==========
# Disable the warning before emptying the Bin
defaults write com.apple.finder WarnOnEmptyTrash -bool false
# Remove items from the Bin after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

# Enable snap-to-grid
/usr/libexec/PlistBuddy -c "Set :TrashViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# Show icon previews
/usr/libexec/PlistBuddy -c "Set :TrashViewSettings:IconViewSettings:showIconPreview true" ~/Library/Preferences/com.apple.finder.plist


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
# PfCm = Computer | PfVo = Volume | PfHm = $HOME | PfDe = Desktop | PfDo = Documents | PfAF = All My Files | PfLo = Other
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
defaults write com.apple.Finder FXPreferredViewStyle -string icnv
# Show folders at the top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# When performing a search, search the current folder by default
# `SCcf` = current folder | `SCev` = this mac | `SCsp` = previous search scope
defaults write com.apple.finder FXDefaultSearchScope -string SCcf

# Enable snap-to-grid & icon previews by default on all windows
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showIconPreview true" ~/Library/Preferences/com.apple.finder.plist

# Expand/Shrink "Get Info" panes
defaults write com.apple.finder FXInfoPanesExpanded -dict \
General -bool true \
MetaData -bool true \
OpenWith -bool true \
Preview -bool false \
Privileges -bool false \

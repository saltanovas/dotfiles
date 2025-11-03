#!/bin/bash

set -euo pipefail

# Enable quit the Finder
defaults write com.apple.finder QuitMenuItem -bool true

# ========================================
# Bin
# ========================================
# Disable the warning before emptying the Bin
defaults write com.apple.finder WarnOnEmptyTrash -bool false
# Remove items after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool true
# Enable snap-to-grid & show icon previews
/usr/libexec/PlistBuddy \
    -c "Set :TrashViewSettings:IconViewSettings:arrangeBy grid" \
    -c "Set :TrashViewSettings:IconViewSettings:showIconPreview true" \
    "$HOME/Library/Preferences/com.apple.finder.plist"


# ========================================
# Browsing
# ========================================
# Set Desktop as the default location for any new window
# PfCm = Computer | PfVo = Volume | PfHm = $HOME | PfDe = Desktop | PfDo = Documents | PfAF = All My Files | PfLo = Any other path
# The path for `PfLo` is set using `NewWindowTargetPath "file://<path>/"`
defaults write com.apple.finder NewWindowTarget -string "PfDe"

# When performing a search, search the current folder by default
# `SCcf` = current folder | `SCev` = this mac | `SCsp` = previous search scope
defaults write com.apple.finder FXDefaultSearchScope -string SCcf

# ========== Files ==========
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# ========== Folders ==========
# Show folders at the top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Show the ~/Library folder
chflags nohidden ~/Library
# Show the /Volumes folder
chflags nohidden /Volumes

# ========== Layout ==========
# Always open in icon view
# `icnv` = Icon | `Nlsv` = List | `clmv` = Column | `glyv` = Gallery
defaults write com.apple.Finder FXPreferredViewStyle -string icnv
# Enable snap-to-grid & show icon previews
/usr/libexec/PlistBuddy \
    -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" \
    -c "Set :StandardViewSettings:IconViewSettings:showIconPreview true" \
    "$HOME/Library/Preferences/com.apple.finder.plist"


# ========================================
# Window appearance
# ========================================
# ========== Toolbar ==========
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

# ========== Panes ==========
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    MetaData -bool true \
    OpenWith -bool true \
    Preview -bool false \
    Privileges -bool false \

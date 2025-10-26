#!/bin/bash

set -euo pipefail

# Sensitivity
defaults write NSGlobalDomain com.apple.mouse.scaling -float 1.0
# Acceleration
defaults write NSGlobalDomain com.apple.mouse.linear -bool true
# Natural scrolling | Mimics touch devices
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# ========================================
# Click
# ========================================
# Secondary click
# OneButton = off | TwoButton = right click | TwoButtonSwapped = left click
defaults write NSGlobalDomain MouseButtonMode -string TwoButton

# ========================================
# Double tap
# ========================================
# One finger | Smart zoom
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseOneFingerDoubleTapGesture -bool true
# Two fingers | Mission Control
# 0 = off | 3 = Mission Control | No other options
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerDoubleTapGesture -int 3

# ========================================
# Swipe
# ========================================
# One finger | Swipe between pages
defaults write NSGlobalDomain AppleEnableMouseSwipeNavigateWithScrolls -int 1
# Two fingers | Swipe between spaces/desktops
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerHorizSwipeGesture -int 2

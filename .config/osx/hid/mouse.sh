#!/bin/bash

set -euo pipefail

# Sensitivity
defaults write NSGlobalDomain com.apple.mouse.scaling -float 1.0
# Enable mouse acceleration
defaults write NSGlobalDomain com.apple.mouse.linear -bool true

# ========== Scroll ==========
# Speed
defaults write NSGlobalDomain com.apple.scrollwheel.scaling -float 0.3125
# Enable inertia
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseMomentumScroll -bool true

# ========== Secondary click ==========
# OneButton = off | TwoButton = right click | TwoButtonSwapped = left click
defaults write NSGlobalDomain MouseButtonMode -string TwoButton

# ========== Double tap ==========
# One finger
# 0 = Off | 1 = Smart zoom
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseOneFingerDoubleTapGesture -int 1
# Two fingers
# 0 = Off | 3 = Mission Control
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerDoubleTapGesture -int 3

# ========== Vertical Swipe ==========
# One finger
# 0 = Off | 1 = Swipe between pages
defaults write NSGlobalDomain AppleEnableMouseSwipeNavigateWithScrolls -int 1
# Two fingers
# 0 = Off | 2 = Between spaces
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerHorizSwipeGesture -int 2

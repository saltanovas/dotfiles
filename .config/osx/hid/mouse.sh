#!/bin/bash

# Sensitivity
defaults write NSGlobalDomain com.apple.mouse.scaling -float 1.0
# Pointer acceleration | Moves more precisely for slower pointer speeds
defaults write NSGlobalDomain com.apple.mouse.linear -bool true

# Scroll speed
defaults write NSGlobalDomain com.apple.scrollwheel.scaling -float 0.3125
# Inertia when scrolling
defaults write com.apple.AppleMultitouchMouse MouseMomentumScroll -bool true

# Secondary click
defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string TwoButton

# Double tap | One finger
# 0 = Off | 1 = Smart zoom
defaults write com.apple.AppleMultitouchMouse MouseOneFingerDoubleTapGesture -int 1
# Double tap | Two fingers
# 0 = Off | 3 = Mission Control
defaults write com.apple.AppleMultitouchMouse MouseTwoFingerDoubleTapGesture -int 3

# Vertical Swipe | One finger
# 0 = Off | 1 = Swipe between pages
defaults write NSGlobalDomain AppleEnableMouseSwipeNavigateWithScrolls -int 1
# Vertical Swipe | Two fingers
# 0 = Off | 2 = Between spaces
defaults write com.apple.AppleMultitouchMouse MouseTwoFingerHorizSwipeGesture -int 2

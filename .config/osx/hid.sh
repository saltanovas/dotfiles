#!/bin/bash

set -euo pipefail

# Natural scrolling | Mimics touch devices
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Enable instant spring loading for directories or apps in dock when hovering files over them
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0



# TODO: cleanup below
defaults write com.apple.AppleMultitouchTrackpad TrackpadMomentumScroll -bool true


defaults write NSGlobalDomain com.apple.scrollwheel.scaling -float 0.3125
defaults write NSGlobalDomain com.apple.trackpad.scrolling -float 0.1838

# ========== Drag ==========
# Tap → tap-and-hold | Cannot release a finger
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
# Tap → tap-and-hold | Can release a finger, tap again to release
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
# Drag with three finger
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true


    "com.apple.driver.AppleBluetoothMultitouch.trackpad" =     {
        HIDScrollZoomModifierMask = 0;
        TrackpadHandResting = 1;
        TrackpadThreeFingerDrag = 0;
    };


# #######################################
# Mouse
# #######################################
# Sensitivity
defaults write NSGlobalDomain com.apple.mouse.scaling -float 1.0
# Acceleration
defaults write NSGlobalDomain com.apple.mouse.linear -bool true

# ========== Scroll ==========
# Speed
defaults write NSGlobalDomain com.apple.scrollwheel.scaling -float 0.4412
# Use inertia when scrolling
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseMomentumScroll -bool true

# ========== Click ==========
# Double click speed
defaults write NSGlobalDomain com.apple.mouse.doubleClickThreshold -float 1.1

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

# ========== Swipe ==========
# One finger
# 0 = Off | 1 = Swipe between pages
defaults write NSGlobalDomain AppleEnableMouseSwipeNavigateWithScrolls -int 1
# Two fingers
# 0 = Off | 2 = Between spaces
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerHorizSwipeGesture -int 2


# #######################################
# Trackpad
# #######################################
# Sensitivity
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 0.6875
defaults write NSGlobalDomain com.apple.trackpad.scrolling -float 0.3125

# Do not disable trackpad when mouse is connected
defaults write com.apple.AppleMultitouchTrackpad USBMouseStopsTrackpad -bool false

# ========== Click ==========
# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
# Click pressure
# 0 = light | 1 = medium | 2 = firm
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 1
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 1

# ========== Secondary click ==========
# Click corner
# 0 = disabled | 1 = bottom left corner | 2 = bottom right corner
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
# Two fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true

# ========== Force click ==========
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool false
# Haptic feedback
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -bool true
# Look up & data detectors
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool true

# ========== Tap ==========
# Double tap two fingers | Smart zoom
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -bool true
# Tap three fingers | Look up & data detectors
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -bool false

# ========== Pinch, Spread & Rotate ==========
# Two fingers | Zoom in or out
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -bool true
# Two fingers | Rotate
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -bool true
# Four fingers
# 2 = Launchpad & Desktop
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2
# Five fingers
# 2 = Launchpad & Desktop
defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2

# Pinch | Launchpad
defaults write com.apple.dock showLaunchpadGestureEnabled -bool true
# Spread | Desktop
defaults write com.apple.dock showDesktopGestureEnabled -bool true

# ========== Swipe horizontally ==========
# Two fingers | Between pages
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
# Three fingers
# 0 = Off | 1 = Between pages | 2 = Between spaces
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 2
# Four fingers
# 0 = Off | 1 = Between pages | 2 = Between spaces
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
# Two fingers from the right edge to left
# 3 = Notification Center
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3

# ========== Swipe vertically ==========
# Three fingers
# 0 = Off | 2 = Mission Control & App Exposé
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 2
# Four fingers
# 0 = Off | 2 = Mission Control & App Exposé
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2

# Swipe up | Mission Control
defaults write com.apple.dock showMissionControlGestureEnabled -bool true
# Swipe down | App Exposé
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

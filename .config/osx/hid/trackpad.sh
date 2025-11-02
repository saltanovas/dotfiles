#!/bin/bash

set -euo pipefail

# Sensitivity
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 0.6875
# Scroll speed
defaults write NSGlobalDomain com.apple.trackpad.scrolling -float 0.1838
# Enable inertia when scrolling
defaults write com.apple.AppleMultitouchTrackpad TrackpadMomentumScroll -bool true

# Keep trackpad enabled when mouse is connected
defaults write com.apple.AppleMultitouchTrackpad USBMouseStopsTrackpad -bool false

# ========== Click ==========
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

# ========== Drag ==========
# Enable drag with three fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Disable tap-and-hold drag
# Tap → tap-and-hold | Cannot release a finger
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
# Tap → tap-and-hold | Can release a finger, tap again to release
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false

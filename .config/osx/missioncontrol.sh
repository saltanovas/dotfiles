#!/bin/bash

set -euo pipefail

# When switching to an application, switch to a Space with open windows for the application
defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool true
# Don’t rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false
# Disable grouping of windows by application in Mission Control
defaults write com.apple.dock expose-group-apps -bool false
# Enable each physical display have a separate space
defaults write com.apple.spaces spans-displays -bool false
# Drag windows to top of screen to enter Mission Control
defaults write com.apple.dock enterMissionControlByTopWindowDrag -bool true

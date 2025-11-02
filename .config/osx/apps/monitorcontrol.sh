#!/bin/bash

set -euo pipefail

defaults write app.monitorcontrol.MonitorControl menuItemStyle -int 1
defaults write app.monitorcontrol.MonitorControl showAdvancedSettings -bool true

defaults write app.monitorcontrol.MonitorControl disableSmoothBrightness -bool false
defaults write app.monitorcontrol.MonitorControl allowZeroSwBrightness -bool false
defaults write app.monitorcontrol.MonitorControl disableCombinedBrightness -bool false
defaults write app.monitorcontrol.MonitorControl enableBrightnessSync -bool false

defaults write app.monitorcontrol.MonitorControl showContrast -bool false
defaults write app.monitorcontrol.MonitorControl hideVolume -bool true
defaults write app.monitorcontrol.MonitorControl hideAppleFromMenu -bool false

defaults write app.monitorcontrol.MonitorControl enableSliderSnap -bool true
defaults write app.monitorcontrol.MonitorControl enableSliderPercent -bool true
defaults write app.monitorcontrol.MonitorControl showTickMarks -bool false
defaults write app.monitorcontrol.MonitorControl multiSliders -bool false

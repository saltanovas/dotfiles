#!/bin/bash

# Load custom key remaps
plist="com.local.KeyRemapping.plist"
if [[ -f "$plist" ]]; then
    ln -sf "$plist" "$HOME/Library/LaunchAgents/$plist"
else
    echo "Key remap config $plist is not found: ensure the file exists or explicitly remove this configuration step."
fi

# Set the function (Fn) key behavior
# 0 = Do Nothing | 1 = Change Input Source | 2 = Show Emoji & Symbols | 3 = Start Dictation
defaults write com.apple.HIToolbox AppleFnUsageType -int 0

# Disable use of F1–F12 keys as standard function keys, use special features printed on each key
# Hold Fn to use function keys
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool false

./hotkeys.sh

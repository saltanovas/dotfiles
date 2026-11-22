#!/bin/bash

SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)" || exit 1

# Load custom key remaps
plist_name="com.local.KeyRemapping.plist"
plist_path="$SCRIPT_DIR/$plist_name"
if [[ -f "$plist_path" ]]; then
    mkdir -p "$HOME/Library/LaunchAgents"
    ln -sfn "$plist_path" "$HOME/Library/LaunchAgents/$plist_name"
fi

# Set the function (Fn) key behavior
# 0 = Do Nothing | 1 = Change Input Source | 2 = Show Emoji & Symbols | 3 = Start Dictation
defaults write com.apple.HIToolbox AppleFnUsageType -int 0

# Disable use of F1–F12 keys as standard function keys, use special features printed on each key
# Hold Fn to use function keys
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool false

"$SCRIPT_DIR/hotkeys.sh"

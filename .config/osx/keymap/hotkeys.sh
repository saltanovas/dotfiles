#!/bin/bash

set -euo pipefail

PB="/usr/libexec/PlistBuddy"
plist="$HOME/Preferences/com.apple.symbolichotkeys.plist"

is_positive_int() { (( $1 >= 0 )) 2>/dev/null; }
is_bool() { [[ "$1" == "true" || "$1" == "false" ]]; }

pb_add() { $PB -c "Add :$1 $2 $3" "$plist"; }
pb_del() { $PB -c "Delete :$1" "$plist"; }

add_hotkey() {
    local id="$1" key1="$2" key2="$3" mods="$4" is_enabled=${5:-false}

    for arg in "$id" "$key1" "$key2" "$mods"; do
        if is_positive_int "$arg"; then
            echo "❌ Value must be a positive integer, got: '$arg'"
            return 1;
        fi
    done

    if ! is_bool "$is_enabled"; then
        echo "❌ Value must be a boolean, got: '$is_enabled'"
        return 1
    fi

    pb_del "AppleSymbolicHotKeys:$id" 2>/dev/null || true
    pb_add "AppleSymbolicHotKeys:$id" dict ""

    pb_add "AppleSymbolicHotKeys:$id:enabled" bool "$is_enabled"
    pb_add "AppleSymbolicHotKeys:$id:value" dict ""
    pb_add "AppleSymbolicHotKeys:$id:value:parameters" array ""
    pb_add "AppleSymbolicHotKeys:$id:value:parameters:0" integer "$key1"
    pb_add "AppleSymbolicHotKeys:$id:value:parameters:1" integer "$key2"
    pb_add "AppleSymbolicHotKeys:$id:value:parameters:2" integer "$mods"
    pb_add "AppleSymbolicHotKeys:$id:value:type" string "standard"
}

# ========================================
# Dock
# ========================================
add_hotkey 52 100 2 1572864
add_hotkey 160 65535 65535 0

# ========================================
# Display
# ========================================
add_hotkey 53 65535 107 8388608
add_hotkey 54 65535 113 8388608

# ========================================
# Mission Control
# ========================================
add_hotkey 32 65535 126 8650752
add_hotkey 34 65535 126 8781824
add_hotkey 163 65535 65535 0
add_hotkey 175 65535 65535 0
add_hotkey 33 65535 125 8650752
add_hotkey 35 65535 125 8781824
add_hotkey 36 65535 103 8388608
add_hotkey 37 65535 103 8519680
add_hotkey 222 65535 65535 0
add_hotkey 190 113 12 8388608
add_hotkey 79 65535 123 8650752
add_hotkey 80 65535 123 8781824
add_hotkey 81 65535 124 8650752
add_hotkey 82 65535 124 8781824
add_hotkey 118 65535 18 262144
add_hotkey 119 65535 19 262144
add_hotkey 120 65535 20 262144
add_hotkey 121 65535 21 262144
add_hotkey 122 65535 23 262144
add_hotkey 123 65535 22 262144
add_hotkey 124 65535 26 262144
add_hotkey 125 65535 28 262144

# ========================================
# Keyboard Navigation
# ========================================
add_hotkey 13 65535 98 8650752
add_hotkey 12 65535 122 8650752
add_hotkey 7 65535 120 8650752
add_hotkey 8 65535 99 8650752
add_hotkey 9 65535 118 8650752
add_hotkey 10 65535 96 8650752
add_hotkey 11 65535 97 8650752
# Change "Move focus to next window" default shortcut (hyperKey + `)
add_hotkey 27 96 50 1835008 true
add_hotkey 57 65535 100 8650752
add_hotkey 159 65535 36 262144

# ========================================
# Spotlight
# ========================================
add_hotkey 64 32 49 1048576
add_hotkey 65 32 49 1572864

# ========================================
# Accessibility
# ========================================
add_hotkey 25 46 47 1835008
add_hotkey 26 44 43 1835008
add_hotkey 21 56 28 1835008
add_hotkey 162 65535 96 9961472
add_hotkey 231 65535 65535 0
add_hotkey 230 65535 65535 0
add_hotkey 232 65535 65535 0
add_hotkey 59 65535 96 9437184
add_hotkey 225 65535 65535 0
add_hotkey 226 65535 65535 0
add_hotkey 227 65535 65535 0
add_hotkey 228 65535 65535 0
add_hotkey 229 65535 65535 0

# ========================================
# Dictation
# ========================================
add_hotkey 164 65535 65535 0

# ========================================
# App Shortcuts
# ========================================
add_hotkey 98 47 44 1179648
# The same trick works for any other built-in macOS command: https://stackoverflow.com/a/79797334/13047140
defaults write -g NSUserKeyEquivalents -dict-add "Emoji & Symbols" "\0"

# ========================================
# Services
# ========================================
$PB \
    -c 'Delete :NSServicesStatus:"com.apple.SpotlightService - SEARCH_WITH_SPOTLIGHT - doSearchWithSpotlight"' \
    -c 'Delete :NSServicesStatus:"com.apple.Safari - Search With %WebSearchProvider@ - searchWithWebSearchProvider"' \
    -c 'Delete :NSServicesStatus:"com.apple.BluetoothFileExchange - Send File To Bluetooth Device - sendFileUsingBluetoothOBEXService"' \
    -c 'Delete :NSServicesStatus:"com.apple.Stickies - Make Sticky - makeStickyFromTextService"' \
    -c 'Delete :NSServicesStatus:"com.apple.Terminal - Open man Page in Terminal - openManPage' \
    -c 'Delete :NSServicesStatus:"com.apple.Terminal - Search man Page Index in Terminal - searchManPages' \
    "$HOME/Library/Preferences/pbs.plist"

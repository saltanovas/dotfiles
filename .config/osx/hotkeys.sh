#!/bin/bash

set -euo pipefail

PLIST=~/Library/Preferences/com.apple.symbolichotkeys.plist
PB="/usr/libexec/PlistBuddy"

pb_add() { $PB -c "Add :$1 $2 $3" "$PLIST"; }
pb_del() { $PB -c "Delete :$1" "$PLIST"; }

add_hotkey() {
    local id="$1" is_enabled="$2" key1="$3" key2="$4" mods="$5"
    
    pb_del "AppleSymbolicHotKeys:$id" 2>/dev/null || true
    pb_add "AppleSymbolicHotKeys:$id" dict ""
    pb_add "AppleSymbolicHotKeys:$id:enabled" bool "$is_enabled"
    
    pb_add "AppleSymbolicHotKeys:$id:value" dict ""
    pb_add "AppleSymbolicHotKeys:$id:value:parameters" array ""
    pb_add "AppleSymbolicHotKeys:$id:value:parameters:0" integer "$key1"
    pb_add "AppleSymbolicHotKeys:$id:value:parameters:1" integer "$key2"
    pb_add "AppleSymbolicHotKeys:$id:value:parameters:2" integer "$mods"
    
    pb_add "AppleSymbolicHotKeys:$id:value:type" string standard
}


# ========================================
# Dock
# ========================================
add_hotkey 52 false 100 2 1572864
add_hotkey 160 false 65535 65535 0

# ========================================
# Display
# ========================================
add_hotkey 53 false 65535 107 8388608
add_hotkey 54 false 65535 113 8388608

# ========================================
# Mission Control
# ========================================
add_hotkey 32 false 65535 126 8650752
add_hotkey 34 false 65535 126 8781824
add_hotkey 163 false 65535 65535 0
add_hotkey 175 false 65535 65535 0
add_hotkey 33 false 65535 125 8650752
add_hotkey 35 false 65535 125 8781824
add_hotkey 36 false 65535 103 8388608
add_hotkey 37 false 65535 103 8519680
add_hotkey 222 false 65535 65535 0
add_hotkey 190 false 113 12 8388608
add_hotkey 79 false 65535 123 8650752
add_hotkey 80 false 65535 123 8781824
add_hotkey 81 false 65535 124 8650752
add_hotkey 82 false 65535 124 8781824
add_hotkey 118 false 65535 18 262144
add_hotkey 119 false 65535 19 262144
add_hotkey 120 false 65535 20 262144
add_hotkey 121 false 65535 21 262144
add_hotkey 122 false 65535 23 262144
add_hotkey 123 false 65535 22 262144
add_hotkey 124 false 65535 26 262144
add_hotkey 125 false 65535 28 262144

# ========================================
# Keyboard
# ========================================
add_hotkey 13 false 65535 98 8650752
add_hotkey 12 false 65535 122 8650752
add_hotkey 7 false 65535 120 8650752
add_hotkey 8 false 65535 99 8650752
add_hotkey 9 false 65535 118 8650752
add_hotkey 10 false 65535 96 8650752
add_hotkey 11 false 65535 97 8650752
add_hotkey 27 true 96 50 1835008
add_hotkey 57 false 65535 100 8650752
add_hotkey 159 false 65535 36 262144

# ========================================
# Spotlight
# ========================================
add_hotkey 64 false 32 49 1048576
add_hotkey 65 false 32 49 1572864

# ========================================
# Accessibility
# ========================================
add_hotkey 25 false 46 47 1835008
add_hotkey 26 false 44 43 1835008
add_hotkey 21 false 56 28 1835008
add_hotkey 162 false 65535 96 9961472
add_hotkey 231 false 65535 65535 0
add_hotkey 230 false 65535 65535 0
add_hotkey 232 false 65535 65535 0
add_hotkey 59 false 65535 96 9437184
add_hotkey 225 false 65535 65535 0
add_hotkey 226 false 65535 65535 0
add_hotkey 227 false 65535 65535 0
add_hotkey 228 false 65535 65535 0
add_hotkey 229 false 65535 65535 0

# ========================================
# App Shortcuts
# ========================================
add_hotkey 98 false 47 44 1179648

#!/bin/bash

PB="/usr/libexec/PlistBuddy"

add_hotkey() {
    local id="$1" key1="$2" key2="$3" mods="$4" is_enabled=$(( ${5:-0} != 0 ))
    hotkeys_plist="$HOME/Library/Preferences/com.apple.symbolichotkeys.plist"
    pbadd() { $PB -c "Add :$1 $2 $3" "$hotkeys_plist"; }

    $PB -c "Delete :AppleSymbolicHotKeys:${id}" "$hotkeys_plist" 2>/dev/null || true
    pbadd "AppleSymbolicHotKeys:${id}:enabled" integer "$is_enabled"
    pbadd "AppleSymbolicHotKeys:${id}:value:parameters" array ""
    pbadd "AppleSymbolicHotKeys:${id}:value:parameters:0" integer "$key1"
    pbadd "AppleSymbolicHotKeys:${id}:value:parameters:1" integer "$key2"
    pbadd "AppleSymbolicHotKeys:${id}:value:parameters:2" integer "$mods"
    pbadd "AppleSymbolicHotKeys:${id}:value:type" string "standard"
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
add_hotkey 27 96 50 1835008 1
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
defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add "Emoji & Symbols" "\0"
defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add "Log Out Aivaras Šaltanovas..." "\0"
defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add "Log Out Aivaras Šaltanovas" "\0"

# ⌘⇧R
defaults write com.apple.Safari NSUserKeyEquivalents -dict-add "Reload Page From Origin" "@\$r"
defaults write com.apple.Safari NSUserKeyEquivalents -dict-add "Paste and Match Style" "@\$v"
defaults write com.apple.ActivityMonitor NSUserKeyEquivalents -dict-add "Filter Processes" "@f"

# ========================================
# Services ([p]aste[b]oard [s]ervices)
# ========================================
# Removing all entries restores default values, so each must be disabled individually
pbs_plist="$HOME/Library/Preferences/pbs.plist"
services=(
    "com.apple.SpotlightService - SEARCH_WITH_SPOTLIGHT - doSearchWithSpotlight"
    "com.apple.Safari - Search With %WebSearchProvider@ - searchWithWebSearchProvider"
    "com.apple.BluetoothFileExchange - Send File To Bluetooth Device - sendFileUsingBluetoothOBEXService"
    "com.apple.Stickies - Make Sticky - makeStickyFromTextService"
    "com.apple.Terminal - Open man Page in Terminal - openManPage"
    "com.apple.Terminal - Search man Page Index in Terminal - searchManPages"
)
$PB -c "Delete :NSServicesStatus" "$pbs_plist" 2>/dev/null || true
for service in "${services[@]}"; do
    $PB -c "Add :NSServicesStatus:'$service':enabled_context_menu bool false" "$pbs_plist"
    $PB -c "Add :NSServicesStatus:'$service':enabled_services_menu bool false" "$pbs_plist"
    $PB -c "Add :NSServicesStatus:'$service':presentation_modes:ContextMenu bool false" "$pbs_plist"
    $PB -c "Add :NSServicesStatus:'$service':presentation_modes:ServicesMenu bool false" "$pbs_plist"
done

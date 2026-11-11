#!/bin/bash

set -euo pipefail

wallpaper="wallpaper.png"
plist="$HOME/Library/Application Support/com.apple.wallpaper/Store/Index.plist"
PB="/usr/libexec/PlistBuddy"

if [ ! -f "$wallpaper" ]; then
    echo "Wallpaper '$wallpaper' is not found"
    return 1
fi

if [ ! -f "$plist" ]; then
    echo "plist '$plist' is not found"
    return 1
fi

$PB -c "Add AllSpacesAndDisplays:Desktop:Content:Choices:0:Files array" "$plist" 2>/dev/null
$PB -c "Add AllSpacesAndDisplays:Desktop:Content:Choices:0:Files:0 dict" "$plist" 2>/dev/null
$PB -c "Add AllSpacesAndDisplays:Desktop:Content:Choices:0:Files:0:relative string file:///$wallpaper" "$plist" 2>/dev/null \
|| $PB -c "Set AllSpacesAndDisplays:Desktop:Content:Choices:0:Files:0:relative file:///$wallpaper" "$plist"

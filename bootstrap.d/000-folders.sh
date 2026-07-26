#!/bin/bash

typeset -A folders=(
    ["p"]="greaterthan"
    ["w"]="briefcase.fill"
    ["ss"]="camera.viewfinder"
)

for fname in "${!folders[@]}"; do
    if [[ ! -d "$HOME/$fname" && -d "$HOME/Desktop/$fname" && ! -L "$HOME/Desktop/$fname" ]]; then
        mv "$HOME/Desktop/$fname" "$HOME"
    fi

    mkdir -p "$HOME/$fname"
    printf -v icon '{"sym":"%s"}' "${folders[$fname]}"
    xattr -w com.apple.icon.folder#S "$icon" "$HOME/$fname"

    ln -sfn "$HOME/$fname" "$HOME/Desktop"
done

if brctl status >/dev/null 2>&1; then
    icloud="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
    ln -sfn "$icloud/Music" "$HOME/Music/iCloud"
    ln -sfn "$icloud/Wallpapers/Desktop" "$HOME/Pictures/Wallpapers"
fi

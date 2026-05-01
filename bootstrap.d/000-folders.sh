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

ln -sfn "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Music" "$HOME/Music/iCloud"

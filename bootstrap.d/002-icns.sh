#!/bin/bash

ICONS_HOME="$DOTFILES_ROOT/icns"

if command -v fileicon >/dev/null; then
    echo "Unable to set custom file icons: fileicon is not found"
    exit 1
fi

typeset -A app_icons=(
    "/Applications/Alacritty.app" "$ICONS_DIR/alacritty/alacritty-scanlines.png"
)

# '!' returns keys, without it would return values
for app in "${!app_icons[@]}"; do
    [[ -d "$app" ]] || continue
    icon="${app_icons[$app]}"
    fileicon set "$app" "$icon"
done

killall Dock

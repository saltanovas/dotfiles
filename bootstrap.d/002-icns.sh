#!/bin/bash

ICONS_HOME="$DOTFILES_ROOT/icns"

if ! command -v fileicon >/dev/null; then
    echo "Unable to set custom app icons: fileicon is not found"
    exit 1
fi

typeset -A app_icons=(
    ["Alacritty.app"]="$ICONS_HOME/alacritty/alacritty-scanlines.png"
    ["VLC.app"]="$ICONS_HOME/vlc.icns"
    ["Copilot.app"]="$ICONS_HOME/copilot.icns"
)

# '!' returns keys, without it would return values
for app in "${!app_icons[@]}"; do
    appdir=""
    for base in "/Applications" "$HOME/Applications"; do
        [[ -d "$base/$app" ]] && appdir="$base/$app" && break
    done

    [[ -z "$appdir" ]] && continue
    icon="${app_icons[$app]}"
    fileicon set "$appdir" "$icon"
done

killall Dock

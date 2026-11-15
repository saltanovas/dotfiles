#!/bin/bash

icons_home="$DOTFILES_ROOT/icns"
typeset -A app_icons=(
    ["Alacritty.app"]="$icons_home/alacritty.icns"
    ["VLC.app"]="$icons_home/vlc.icns"
    ["Copilot.app"]="$icons_home/copilot.icns"
)
# '!' returns keys, without it would return values
for app in "${!app_icons[@]}"; do
    command -v fileicon >/dev/null || break

    appdir=""
    for base in "/Applications" "$HOME/Applications"; do
        [[ -d "$base/$app" ]] && appdir="$base/$app" && break
    done

    [[ -z "$appdir" ]] && continue
    icon="${app_icons[$app]}"
    fileicon set "$appdir" "$icon"
done

killall Dock

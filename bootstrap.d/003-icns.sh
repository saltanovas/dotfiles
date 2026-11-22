#!/usr/bin/env bash

typeset -A app_icons=(
    ["Alacritty.app"]="$DOTFILES_ROOT/icns/alacritty.icns"
    ["VLC.app"]="$DOTFILES_ROOT/icns/vlc.icns"
    ["Copilot.app"]="$DOTFILES_ROOT/icns/copilot.icns"
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
    fileicon set "$appdir" "$icon" > /dev/null
done

xattr -w 'com.apple.icon.folder#S' '{"sym":"greaterthan"}' "$HOME/p"
xattr -w 'com.apple.icon.folder#S' '{"sym":"briefcase.fill"}' "$HOME/w"
xattr -w 'com.apple.icon.folder#S' '{"sym":"camera.viewfinder"}' "$HOME/s"

killall Dock

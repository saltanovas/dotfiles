#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Pravalturas
# @raycast.mode silent
# @raycast.packageName mpv

# Optional parameters:
# @raycast.icon 🍄

# Documentation:
# @raycast.description Plays Pravalturas
# @raycast.author saltanovas

pname="mpv"
socket="/tmp/$pname/pravalturas.sock"
pid=$(pgrep -f -- "$pname .*--input-ipc-server=${socket}")

if [ -n "$pid" ]; then
    "$HOME/Desktop/p/dotfiles/.local/bin/toggle.applescript" "$pid"
    exit 0
fi

mpv \
    --force-window=yes \
    --terminal=no \
    --vid=no \
    --geometry=960x540-0+0 \
    --script-opts-append=console-font_size=42 \
    --input-ipc-server="${socket}" \
    --log-file="${XDG_CACHE_HOME}/${pname}/pravalturas-$(date +%s).log" \
    "https://www.youtube.com/playlist?list=PLZN167duhpXjsyGDXQvArtvstIiN3cBO2" \
    </dev/null >/dev/null 2>&1 &

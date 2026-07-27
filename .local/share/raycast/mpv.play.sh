#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Play
# @raycast.mode silent
# @raycast.packageName mpv

# Optional parameters:
# @raycast.icon https://upload.wikimedia.org/wikipedia/commons/7/73/Mpv_logo_%28official%29.png
# @raycast.argument1 { "type": "text", "placeholder": "URI" }

# Documentation:
# @raycast.description Plays media in mpv
# @raycast.author saltanovas

mpv \
    --terminal=no \
    "$1" </dev/null >/dev/null 2>&1 &

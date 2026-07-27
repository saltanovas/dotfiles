#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Play
# @raycast.mode silent
# @raycast.packageName mpv

# Optional parameters:
# @raycast.icon icns/mpv.png
# @raycast.argument1 { "type": "text", "placeholder": "URI" }

# Documentation:
# @raycast.description Plays media in mpv
# @raycast.author saltanovas

mpv \
    --terminal=no \
    "$1" </dev/null >/dev/null 2>&1 &

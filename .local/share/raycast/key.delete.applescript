#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title ‎
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🗑️

# Documentation:
# @raycast.description Moves the current selection to Trash
# @raycast.author saltanovas

tell application "System Events"
    key code 51 using command down
end tell

return
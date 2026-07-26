#!/usr/bin/osascript

# Required parameters:
# @argument1 { "type": "number", "placeholder": "PID", "optional": false }

# Documentation:
# @author saltanovas
# @description Toggles a running app instance by PID

on run argv
    set PID to (item 1 of argv) as integer

    tell application "System Events"
        tell (first application process whose unix id is PID)
            if frontmost then
                set visible to false
            else
                set visible to true
                set frontmost to true
            end if
        end tell
    end tell
end run

#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open in VS Code
# @raycast.mode silent
# @raycast.packageName Visual Studio Code

# Optional parameters:
# @raycast.icon https://images.icon-icons.com/2107/PNG/512/file_type_vscode_icon_130084.png

# Documentation:
# @raycast.description Opens selected Finder items in VS Code
# @raycast.author saltanovas

tell application "Finder"
    set selectedItems to get selection
 
    if selectedItems is {} then
        error "No files selected in Finder"
    end if

    set shellCommand to "/usr/bin/open -b com.microsoft.VSCode --"

    repeat with selectedItem in selectedItems
        set filePath to POSIX path of (selectedItem as alias)
        set shellCommand to shellCommand & " " & quoted form of filePath
    end repeat
end tell

do shell script shellCommand

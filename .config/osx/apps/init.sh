#!/bin/bash

SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)" || exit 1

# Remove useless apps
rm -rf /Applications/GarageBand.app
rm -rf /Applications/iMovie.app

# Configure apps
"$SCRIPT_DIR/monitorcontrol.sh"
"$SCRIPT_DIR/monitorcontrol.sh"
"$SCRIPT_DIR/safari.sh"
"$SCRIPT_DIR/screencapture.sh"
"$SCRIPT_DIR/terminal.sh"

#!/bin/bash

set -euo pipefail

# Remove useless apps
rm -rf /Applications/GarageBand.app
rm -rf /Applications/iMovie.app

# Configure apps
./monitorcontrol.sh
./terminal.sh

#!/bin/bash

set -euo pipefail

# Set the number of columns | Default is 7
defaults write com.apple.dock springboard-columns -int 9
# Set the number of rows | Default is 5
defaults write com.apple.dock springboard-rows -int 5

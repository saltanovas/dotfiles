#!/bin/bash

set -euo pipefail

# Disable line marks
defaults write com.apple.Terminal ShowLineMarks -bool false

# Restrict to use UTF-8 encoding only
defaults write com.apple.Terminal StringEncodings -array 4

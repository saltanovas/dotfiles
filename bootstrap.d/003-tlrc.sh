#!/bin/bash

set -euo pipefail

. "$DOTFILES_ROOT/lib/utils.sh"

TLRC_CUSTOM_PAGES_NAMESPACE="custom"
TLRC_CUSTOM_PAGES_DIR="$HOME/Library/Caches/tlrc/pages.$TLRC_CUSTOM_PAGES_NAMESPACE/common"

ohai "Enabling custom tldr pages..."

command -v tlrc >/dev/null 2>&1 || abort "Failed to enable custom tldr pages: 'tlrc' client is not found."

mkdir -p "$TLRC_CUSTOM_PAGES_DIR"

ohai "Custom tldr pages are enabled and stored at $TLRC_CUSTOM_PAGES_DIR"

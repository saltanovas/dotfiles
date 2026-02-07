#!/bin/bash

gum log --level info "Setting default applications for various document types..."
if out=$(duti "$DOTFILES_ROOT/.config/duti/duti.conf"); then
    gum log --level error "Failed to set default applications: $out"
    exit 1
fi

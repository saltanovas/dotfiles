#!/bin/bash

set -eu

. "$DOTFILES_ROOT/lib/utils.sh"


# 1. Get context/scope: either p or w
# 2. If p: saltanovas
# 3. If w: get name, and have saltanovas-<name>


SSH_HOME="$HOME/.ssh"
SSH_IDENTITY=$(id -un)
SSH_DEVICE_CLASS="p" # p: personal, w: work
SSH_KEY_NAME="id_ed25519_${SSH_IDENTITY}"
SSH_KEY_TITLE="${SSH_IDENTITY}@${SSH_DEVICE_CLASS}:$(hostname -s)"

mkdir -p "$SSH_HOME"
chmod 700 "$SSH_HOME"

for file in "$DOTFILES_ROOT/.config/.ssh/"*; do
    ln -sfn "$file" "$SSH_HOME"
done

opts=(
    "saltanovas"
    "saltanovas-\${workplace}"
)

if [[ "p" ]]; then
    SSH_IDENTITY="saltanovas"
elif [[ "w" ]]; then
    # TODO: get the name
    SSH_IDENTITY="saltanovas-$NAME"
else
    abort "SSH_DEVICE_CLASS must be either 'p' (personal) or 'w' (work)."
fi

ssh-keygen -t ed25519 -f "$SSH_HOME/$SSH_KEY_NAME"

# TODO: either optional, mandatory on "p" only or choose github vs gitlab vs both
ohai "Adding SSH key to GitHub account..."
gh ssh-key add "$SSH_HOME/$SSH_KEY_NAME".pub --title "$SSH_KEY_TITLE"

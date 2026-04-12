#!/bin/bash

SSH_HOME="$HOME/.ssh"
SSH_KEY_NAME="id_ed25519"
SSH_KEY_TITLE="$(
    username=$(id -un)
    serial=$(system_profiler SPHardwareDataType | grep "Serial Number" | awk '{print $NF}')
    printf "%s@%s" "$username" "$serial"
)"

mkdir -p "$SSH_HOME"
chmod 700 "$SSH_HOME"

for f in "$DOTFILES_ROOT/.config/ssh/"*; do
    ln -sfn "$f" "$SSH_HOME"
done

ssh-keygen -t ed25519 -f "$SSH_HOME/$SSH_KEY_NAME"

echo "Adding public key to your GitHub account..."
gh ssh-key add "$SSH_HOME/$SSH_KEY_NAME".pub --title "$SSH_KEY_TITLE"

#!/bin/bash

SSH_KEY_PATH="$HOME/.ssh/id_ed25519"
SSH_KEY_TITLE="$(
    username=$(id -un)
    serial=$(system_profiler SPHardwareDataType | grep "Serial Number" | awk '{print $NF}')
    printf "%s@%s" "$username" "$serial"
)"

[[ -e "$SSH_KEY_PATH" || -e "$SSH_KEY_PATH.pub" ]] || ssh-keygen -t ed25519 -f "$SSH_KEY_PATH" || exit 1

if ! gh auth status --hostname github.com >/dev/null 2>&1; then
    echo "Logging in to GitHub..."
    gh auth login --hostname github.com --web --git-protocol ssh --skip-ssh-key
fi

titles=$(gh api --paginate user/keys --jq '.[].title') || exit 1
if ! grep -Fxq -- "$SSH_KEY_TITLE" <<< "$titles"; then
    echo "Adding public key to your GitHub account..."
    gh ssh-key add "$SSH_KEY_PATH.pub" --title "$SSH_KEY_TITLE"
fi

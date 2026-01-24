#!/bin/bash

set -euo pipefail

. "$DOTFILES_ROOT/lib/utils.sh"

NGROK_HOME="$HOME/.config/ngrok"
NGROK_CONFIG="$NGROK_HOME/ngrok.yml"
NGROK_CONFIG_TEMPLATE="$HOME/ngrok.yml.template"

open() {
    if command -v open >/dev/null 2>&1; then
      open "$@"
    elif command -v xdg-open >/dev/null 2>&1; then
      xdg-open "$@"
    else
      printf "Could not perform automatic redirect. Please open the following resource manually:\n%s\n" "$@"
    fi
}

set_authtoken() {
    ack "You will be redirected to the official ngrok dashboard to obtain an authtoken." \
        "Copy the token and return here to enter it."
    open "https://dashboard.ngrok.com/get-started/your-authtoken"

    local authtoken
    echo "Authtoken: " && read -rs authtoken && echo
    # ngrok ensures the file exists, creates if not
    ngrok config add-authtoken "$authtoken" > /dev/null
    echo "Authtoken has been saved successfully at $NGROK_CONFIG"
}

ohai "Setting up ngrok..."
command -v ngrok >/dev/null 2>&1 || abort "ngrok is not found."

mkdir -p "$NGROK_HOME"

if [[ ! -f "$NGROK_CONFIG" ]]; then
    [[ -f "$NGROK_CONFIG_TEMPLATE" ]] && cp -L "$NGROK_CONFIG_TEMPLATE" "$NGROK_CONFIG"
    set_authtoken
    exit 0
fi

printf "Config file %s already exists. Creating backup...\n" "$NGROK_CONFIG"
backup=$(backup "$NGROK_CONFIG")
cp "$backup" "$NGROK_CONFIG"
printf "Backup created at %s\n" "$backup"

set_authtoken

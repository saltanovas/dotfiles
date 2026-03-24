#!/bin/bash

HOSTNAME="$(hostname -s)"
printf " Your hostname is: %s\n" "$HOSTNAME"
# TODO: Can be selective using gum.
#  Either saltanovas or enter company name. We set primary here, secondary is going to be set manually later if needed
gum confirm "Do you want to change it?" || exit 0

while :; do
    printf "Enter your new hostname: "
    read -r HOSTNAME || exit 1
    [ -n "$HOSTNAME" ] && break
    printf "Hostname cannot be empty.\n\n"
done

sudo scutil --set ComputerName "$HOSTNAME"
sudo scutil --set LocalHostName "$HOSTNAME"
sudo scutil --set HostName "$HOSTNAME"

# Computer name: Aivaras’s MacBook Pro
# Local host name: Aivarass-MacBook-Pro.local
# Host name: Aivarass-MacBook-Pro

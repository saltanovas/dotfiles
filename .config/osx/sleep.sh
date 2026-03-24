#!/bin/bash
#
# Set display sleep time separately for battery and power adapter.
# Usage: ./set-display-sleep.sh <battery_minutes> <adapter_minutes>
# Example: ./set-display-sleep.sh 5 15

# Exit on missing args
if [ $# -ne 2 ]; then
  echo "Usage: $0 <battery_minutes> <adapter_minutes>"
  exit 1
fi

BATTERY_MINUTES="$1"
ADAPTER_MINUTES="$2"

echo "🔋 Setting display sleep on battery to ${BATTERY_MINUTES} min..."
sudo pmset -b displaysleep "$BATTERY_MINUTES"

echo "⚡ Setting display sleep on power adapter to ${ADAPTER_MINUTES} min..."
sudo pmset -c displaysleep "$ADAPTER_MINUTES"

echo "✅ Done."
pmset -g custom | grep displaysleep


# Enable lid wakeup
sudo pmset -a lidwake 1
# Disable machine sleep while charging
sudo pmset -c sleep 0
# Set machine sleep to 5 minutes on battery
sudo pmset -b sleep 5
# Set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standbydelay 86400
# Never go into computer sleep mode
sudo systemsetup -setcomputersleep Off > /dev/null
# go into computer sleep mode after 20min
# sudo systemsetup -setcomputersleep 20

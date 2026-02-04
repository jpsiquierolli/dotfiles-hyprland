#!/bin/bash

# Updated commands with sudo
CMD_CONNECT="sudo twingate connect"
CMD_DISCONNECT="sudo twingate disconnect"

# Check current status
# We check status without sudo because 'status' usually works as user, 
# but if it fails, you can add sudo here too.
STATUS=$(twingate status | grep -iE "online|connected|started")

if [ -z "$STATUS" ]; then
    # Connect
    notify-send "Twingate" "Connecting..."
    $CMD_CONNECT
else
    # Disconnect
    notify-send "Twingate" "Disconnecting..."
    $CMD_DISCONNECT
fi

# Force Waybar to update the module immediately
pkill -SIGRTMIN+1 waybar

#!/bin/bash
# ~/.config/hypr/scripts/smart_lock.sh

MOUSE_ID="046d:c539"

# 1. If we are already locked, and this is called, check if we should unlock
if pgrep -x "hyprlock" > /dev/null; then
    if lsusb | grep -q "$MOUSE_ID"; then
        pkill -USR1 hyprlock
        exit 0
    fi
fi

# 2. If we are trying to lock, check if mouse is present
if lsusb | grep -q "$MOUSE_ID"; then
    # Mouse detected: Do not lock
    exit 0
else
    # No mouse: Lock normally
    hyprlock
fi

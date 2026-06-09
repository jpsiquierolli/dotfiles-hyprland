#!/bin/bash

# Get the numeric ID (0, 1, etc.) of the currently focused monitor
ACTIVE_MONITOR=$(hyprctl monitors -j | jq '.[] | select(.focused == true) | .id')

# Check if the panel is currently open
if eww active-windows | grep -q "window_panel"; then
    eww close window_panel background_closer
else
    # Open the windows and pass the numeric ID
    eww open background_closer --screen "$ACTIVE_MONITOR"
    eww open window_panel --screen "$ACTIVE_MONITOR"
fi

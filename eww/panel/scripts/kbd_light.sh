#!/bin/bash

# Find the exact name of your keyboard backlight device
KBD_DEV=$(brightnessctl --class=leds -l | grep -i 'kbd' | head -n 1 | awk '{print $2}' | tr -d "'")

# If no keyboard backlight is detected, default to off to prevent errors
if [ -z "$KBD_DEV" ]; then
    echo "off"
    exit 0
fi

if [ "$1" == "toggle" ]; then
    CURRENT=$(brightnessctl -d "$KBD_DEV" g)
    if [ "$CURRENT" -eq "0" ]; then
        brightnessctl -d "$KBD_DEV" s 100%
    else
        brightnessctl -d "$KBD_DEV" s 0
    fi
elif [ "$1" == "status" ]; then
    CURRENT=$(brightnessctl -d "$KBD_DEV" g)
    if [ "$CURRENT" -eq "0" ]; then
        echo "off"
    else
        echo "on"
    fi
fi

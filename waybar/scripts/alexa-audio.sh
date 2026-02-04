#!/bin/bash

# Define variables for your specific device
MAC="1C:FE:2B:D3:F5:5E"
SINK="bluez_output.1C_FE_2B_D3_F5_5E.1"

# 1. Connect via Bluetooth
bluetoothctl connect "$MAC"

# 2. Wait 3 seconds for the device to initialize
sleep 3

# 3. Set as default output
pactl set-default-sink "$SINK"

# 4. Move all current playing audio streams to the Echo Dot
pactl list short sink-inputs | cut -f1 | while read -r stream; do
    pactl move-sink-input "$stream" "$SINK"
done

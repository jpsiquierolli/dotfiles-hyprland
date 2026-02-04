#!/bin/bash

MOUSE_ID="046d:c539"

COUNT=$(lsusb | grep -c "$MOUSE_ID")

if [ "$COUNT" -gt 0 ]; then
    exit 0
else
    exit 1
fi

#!/bin/bash

WALLPAPER_DIR="/apl/hyprland/wallpapers"

# swww-daemon is running 
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 0.5 # espera o daemon iniciar
fi

# List files
PICS=$(ls "$WALLPAPER_DIR" | grep -E ".jpg$|.jpeg$|.png$|.webp$")

# Se a lista estiver vazia, avisa (bom para debug)
if [ -z "$PICS" ]; then
    notify-send "Wallpaper Picker" "Nenhum wallpaper encontrado em $WALLPAPER_DIR"
    exit 1
fi

# Clear cache and force use my style.css 
SELECT=$(echo -e "$PICS" | wofi --show dmenu --style "$HOME/.config/wofi/style.css" --prompt "Wallpapers:" --conf /dev/null --cache-file /dev/null)

if [ -n "$SELECT" ]; then
    swww img "$WALLPAPER_DIR/$SELECT" --transition-type center
fi

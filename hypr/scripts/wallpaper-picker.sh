#!/bin/bash

# Caminho atualizado
WALLPAPER_DIR="/apl/hyprland/wallpapers"

# Garante que o swww-daemon está rodando
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 0.5 # espera o daemon iniciar
fi

# Lista os arquivos
PICS=$(ls "$WALLPAPER_DIR" | grep -E ".jpg$|.jpeg$|.png$|.webp$")

# Se a lista estiver vazia, avisa (bom para debug)
if [ -z "$PICS" ]; then
    notify-send "Wallpaper Picker" "Nenhum wallpaper encontrado em $WALLPAPER_DIR"
    exit 1
fi

# Forçamos o uso do seu style.css e limpamos o cache para garantir o visual novo
SELECT=$(echo -e "$PICS" | wofi --show dmenu --style "$HOME/.config/wofi/style.css" --prompt "Wallpapers:" --conf /dev/null --cache-file /dev/null)

if [ -n "$SELECT" ]; then
    swww img "$WALLPAPER_DIR/$SELECT" --transition-type center
fi

 #!/bin/bash


# Classe da janela do Remmina que o Hyprland identifica

WINDOW_CLASS="org.remmina.Remmina"


if hyprctl clients | grep -i "$WINDOW_CLASS" > /dev/null

then

    killall remmina
    pkill -f "remmina"

    hyprctl dispatch workspace 1

else

    remmina -c ~/.local/share/remmina/group_rdp_trabalho_pessoal-jp-windows.remmina &

    hyprctl dispatch workspace 9

fi 

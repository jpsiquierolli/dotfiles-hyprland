 #!/bin/bash


# Window class for remmina

WINDOW_CLASS="org.remmina.Remmina"


if hyprctl clients | grep -i "$WINDOW_CLASS" > /dev/null

then

    # Se a janela existe, mata o processo para fechar a conexão

    killall remmina
    pkill -f "remmina"

    # After closing goes to workspace 1 

    hyprctl dispatch workspace 1

else

    # Opens connection (if not connected)

    remmina -c ~/.local/share/remmina/group_rdp_trabalho_192-168-100-154-3389.remmina &

    

    # goes to workspace 9

    sleep 2

    hyprctl dispatch workspace 9

fi 

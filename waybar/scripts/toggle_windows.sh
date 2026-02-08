 #!/bin/bash


# Classe da janela do Remmina que o Hyprland identifica

WINDOW_CLASS="org.remmina.Remmina"


if hyprctl clients | grep -i "$WINDOW_CLASS" > /dev/null

then

    # Se a janela existe, mata o processo para fechar a conexão

    killall remmina
    pkill -f "remmina"

    # Opcional: volta para o workspace 1 ao fechar

    hyprctl dispatch workspace 1

else

    # Se não existe, abre a conexão

    remmina -c ~/.local/share/remmina/group_rdp_trabalho_192-168-100-154-3389.remmina &

    

    # Aguarda a janela aparecer e pula para o workspace 9

    sleep 2

    hyprctl dispatch workspace 9

fi 

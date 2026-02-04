#!/bin/bash

# Pega o perfil atual
current=$(powerprofilesctl get)

# Faz o ciclo
case "$current" in
  "power-saver")
    powerprofilesctl set balanced
    ;;
  "balanced")
    powerprofilesctl set performance
    ;;
  "performance")
    powerprofilesctl set power-saver
    ;;
esac

#!/usr/bin/env python3
import gi
gi.require_version("Playerctl", "2.0")
from gi.repository import Playerctl, GLib
import argparse
import sys
import signal
import json

def signal_handler(sig, frame):
    sys.stdout.write("\n")
    sys.stdout.flush()
    sys.exit(0)

class PlayerManager:
    def __init__(self, selected_player=None):
        self.manager = Playerctl.PlayerManager()
        self.loop = GLib.MainLoop()
        self.selected_player = selected_player
        
        self.manager.connect("name-appeared", self.on_player_appeared)
        self.manager.connect("player-vanished", self.on_player_vanished)

        signal.signal(signal.SIGINT, signal_handler)
        signal.signal(signal.SIGTERM, signal_handler)
        
        self.init_players()

    def init_players(self):
        for player_name in self.manager.props.player_names:
            if not self.selected_player or self.selected_player == player_name.name:
                self.init_player(player_name)

    def init_player(self, player_name):
        player = Playerctl.Player.new_from_name(player_name)
        player.connect("playback-status", self.update_output)
        player.connect("metadata", self.update_output)
        self.manager.manage_player(player)
        self.update_output(player)

    def update_output(self, player, *args):
        title = player.get_title()
        status = player.props.status

        if not title:
            sys.stdout.write("\n")
            sys.stdout.flush()
            return

        title_esc = title.replace("&", "&amp;")

        # Logic for icons and CSS classes
        if status == "Playing":
            icon = ""
            css_class = "playing"
            text = f"{icon} {title_esc}"
        elif status == "Paused":
            icon = ""
            css_class = "paused"
            text = f"{icon} {title_esc}"
        else:
            text = ""
            css_class = "stopped"

        output = {
            "text": text,
            "class": css_class,
        }
        
        sys.stdout.write(json.dumps(output) + "\n")
        sys.stdout.flush()

    def on_player_appeared(self, manager, player_name):
        if not self.selected_player or self.selected_player == player_name.name:
            self.init_player(player_name)

    def on_player_vanished(self, manager, player):
        sys.stdout.write("\n")
        sys.stdout.flush()

    def run(self):
        self.loop.run()

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--player")
    args = parser.parse_args()
    PlayerManager(args.player).run()

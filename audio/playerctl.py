#!/bin/python3
import sys
import subprocess
import os

filename = os.path.join(os.path.expanduser("~"), ".playerctl-player")

assert len(sys.argv) > 1
command = sys.argv[1]
assert command in ["play", "pause", "prev", "next", "metadata", "status"]
command = sys.argv[1:]

player = ""
if os.path.exists(filename):
    with open(filename) as f:
        lines = f.readlines()
        if len(lines):
            player = lines[0].rstrip()
output = subprocess.check_output(["playerctl", "-l"]).decode("utf-8")

players = list(filter(lambda i:len(i), output.split("\n")))
if not player:
    player = players[0]
if player not in players:
    player = players[0]

if command[0] not in ["play"]:
    for _player in players:
        # Check which one is playing and take the first one
        if "Playing" in subprocess.check_output(["playerctl", "-p", _player, "status"]).decode("utf-8"):
            player = _player
            break;


with open(filename, "w") as f:
    f.write(f"{player}")

print(subprocess.check_output(["playerctl", "-p", player] + command).decode("utf-8"))

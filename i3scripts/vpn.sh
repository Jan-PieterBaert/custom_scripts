#!/bin/bash

# If click, open xterm to restart NetworkManager
if [ $BLOCK_BUTTON -eq 1 ]
then
	uxterm -T "Restarting NetworkManager..." -e ~/.config/i3/scripts/restart_network.sh
fi

# Get the name of the connection
name="$(nmcli -t con | grep -P 'vpn.*(enp2s0|wlp3s0)' | sed 's/:.*//')"
# In case ethernet is not connected
if [ "$name" == "" ]
then
	exit 0
fi
# In case name is longer than 20 characters,
# truncate to 19 characters + ellipsis
if [ "${#name}" -gt "20" ]
then
	name="$(expr substr $essid 1 19)…"
fi

echo "$name"

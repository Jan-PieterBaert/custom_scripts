#!/bin/bash


# If click, open xterm to restart NetworkManager
#if [ $BLOCK_BUTTON -eq 1 ]
#then
#	uxterm -T "Restarting NetworkManager..." -e ~/.config/i3/scripts/restart_network.sh
#fi

# Get the essid (or other name)
#essid="$(nmcli -t con | grep 'wireless.*wlp2s0' | sed 's/:.*//')"
# In case wifi is not connected
#if [ "$essid" == "" ]; then exit; return; fi
# In case essid is longer than 20 characters,
# truncate to 19 characters + ellipsis
#if [ "${#essid}" -gt "15" ]; then essid="$(expr substr $essid 1 14)…"; fi
#
# Get the signal strength
#strength=$( grep '^wlp2s0' /proc/net/wireless | awk '{print $3}' | sed 's/\..*$/%/' )
#
#echo "$essid ($strength)"

name=$(wpa_cli status -i wlp2s0 | grep "^ssid" | grep -oi "[^=]*$")
ip_a=$(wpa_cli -i wlp2s0 status | grep "^ip_add" | grep -o "[^=]*$")
freq=$(wpa_cli -i wlp2s0 status | grep "^freq" | grep -o "[^=]*$" | sed 's/^\([0-9]\)\(.\).*$/\1.\2/g')
perc=$(grep wlp2s0 /proc/net/wireless | awk '{ print int($3 * 100/70)}')

echo "$name($freq|$ip_a|$perc%)"


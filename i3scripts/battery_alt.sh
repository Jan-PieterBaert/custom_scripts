#!/bin/bash
location="/org/freedesktop/UPower/devices/battery_BAT1"
perc=$( upower -i $location | grep 'percentage' | grep -o '[0-9]*' )
state=$( upower -i $location | grep '^\s*state:' | grep -oE '(dis)?charging' )
timeLeft=$( upower -i $location | egrep "time to " | grep -o "[0-9]*\.[0-9]* [a-zA-Z]" )
color="aqua"

if [ $state == 'charging' ]
then
	color="lime"
elif [ $perc -lt 20 ]
then
	notify-send "battery almost empty"
    	color="red"
fi
if [ $state == 'discharging' ] || [ $perc -lt 90 ]
then
	echo "<span color='$color'>${perc}%</span> $timeLeft"
fi

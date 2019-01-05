#!/bin/bash

# If click, open pavucontrol
if [ $BLOCK_BUTTON -eq 1 ]
then
	pavucontrol &
fi

# 1.  List all information.
# 2.  Filter lines starting with 'State', 'Mute', 'Volume' or 'alsa.name'.
# 3.  Remove the '\s*State: ', ... and put ';' at the end of the line 'alsa.name'.
# 4.  Remove the newlines.
# 5.  Replace ';' with newline.
# 6.  Clean names: ALC3236 Analog -> analog, HDMI 1 -> HDMI.
# 7.  Sort on name.
# 8.  Read lines and echo formatted pieces.
# 9.  Put pieces together.
# 10. Put newline at the end.
#pactl list sinks | grep -e '^\s*State' -e '^\s*Mute' -e '^\s*Volume' -e '^\s*alsa.name' |
#sed 's/^\s*State: //; s/^\s*Mute: //; s/.*[^0-9]\([0-9]\+\)%.*/\1/; s/^\s*alsa.name = "\(.*\)"/\1;/; s/$/\t/' |
#tr -d '\n' | sed 's/;\t/\n/g' | sed 's/USB\ Audio/aaUSB/; s/HDMI 1/HDMI/' | sort -k4,4 | 
#while read -r state muted volume name
#do
#	if [ $name == aaUSB ]
#	then
#		if [ $volume -gt 100 ]
#		then
#			echo "<span color='red'>$volume%</span>"
#		else
#			echo "$volume%"
#		fi
#		if [ $muted == yes ]
#		then
#			echo ' MUTED'
#		fi
#	else
#		if [ $state == RUNNING ]
#		then
#			echo " ($name"
#			if [ $volume -gt 100 ]
#			then
#				echo " <span color='red'>$volume%</span>"
#			else
#				echo " $volume%"
#			fi
#			if [ $muted == yes ]
#			then
#				echo ' MUTED'
#			fi
#			echo ')'
#		fi
#	fi
#done |
#tr -d '\n' | sed 's/$/\n/'

amixer get Master | grep -o "\[.*\]" | tr -d "\[\]"  

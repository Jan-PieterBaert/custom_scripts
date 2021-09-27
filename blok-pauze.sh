#!/bin/bash
export TIMEOUT=$1
sleep $TIMEOUT
mpv /home/jan-pieter/git_repos/custum_scripts/alarm.mp3 --loop-file --no-resume-playback


counter_location="/home/jan-pieter/.blok_pauze_counter"

# increase the counter
touch $counter_location
current="$(cat $counter_location)"

# A non-number string + 1 will give 1
new_value=$(($current + $TIMEOUT))
echo $new_value > $counter_location

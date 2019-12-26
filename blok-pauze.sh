#!/bin/bash
export TIMEOUT=$1
sleep $TIMEOUT
mpv /home/jan-pieter/git_repos/custum_scripts/alarm.mp3 --loop-file
exit

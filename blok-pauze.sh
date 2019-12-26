#!/bin/bash
export TIMEOUT=$1
sleep $TIMEOUT
mpv https://www.youtube.com/watch\?v\=Wp0_Y72ARlA --loop-file
exit

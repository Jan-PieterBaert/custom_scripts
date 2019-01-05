#!/bin/bash

ping -c 1 -W .5 8.8.8.8 > /dev/null 2>&1

if [ $? -eq 0 ]
then
	echo 'Network is working'
	read
else
	echo 'Restarting NetworkManager...'
	sudo systemctl restart NetworkManager
fi

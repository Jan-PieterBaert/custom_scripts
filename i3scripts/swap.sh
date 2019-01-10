#!/bin/bash

swap=$( free -h | grep 'Swap:' | awk '{print $3}' )

if [ $(free -m | grep 'Swap:' | awk '{print $3}') -gt "100" ]
then
	echo "${swap}"
fi

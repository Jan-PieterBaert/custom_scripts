#!/bin/bash

lock_file='/home/matthias/.screencast.lck'

if ! [ -e "$lock_file" ]
then
	exit 0
fi

echo '<span color="red">REC</span>'

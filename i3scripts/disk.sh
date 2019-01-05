#!/bin/bash

partitionToStats() {
	stats=$(df -h | grep "$1$")
	echo $(echo $stats | sed 's/[ ]+/ /g' | cut -d " " -f2,3,5 | sed 's/^\(.*\) \(.*\) \(.*\)$/\2\/\1(\3)/g')
}

root="$(partitionToStats "/" )"
home="$(partitionToStats "/home" )"
ff="$(partitionToStats "/fast_files")"

echo "|/:$root|~:$home|FF:$ff|"

#!/bin/bash

uptime -p > /tmp/uptime
weeks="$(cat /tmp/uptime | grep -o '[0-9]* week' | grep -o '[0-9]*')"
days="$(cat /tmp/uptime | grep -o '[0-9]* day' | grep -o '[0-9]*')"
hrs="$(cat /tmp/uptime | grep -o '[0-9]* hour' | grep -o '[0-9]*')"
mins="$(cat /tmp/uptime | grep -o '[0-9]* minute' | grep -o '[0-9]*')"

str=""
if [ "$weeks" != "" ]
then
    str+="$weeks w|"
fi
if [ "$days" != "" ]
then
    str+="$days d|"
fi
if [ "$hrs" != "" ]
then
    str+="$hrs h|"
fi
if [ "$mins" == "" ]
then
mins="0"
fi
str+="$mins m"
str=$(echo $str | tr -d " " | tr "|" " ")
echo $str
rm /tmp/uptime

#!/bin/bash
: '
A small program to have a few different screensaver timeout modes
TODO: add a modes|timeouts file
'

file=$HOME/.presenter-mode
modes=("Default mode" "Study mode" "Code mode" "Presenter mode")
timeouts=("60" "600" "300" "0")
length=${#modes[@]}

if  [ ! -f $file ] || [ -z "$(cat ${file})" ]
then
	echo "file doesn't exists or is empty"
	index=0
else
	source $file
	index=$((($index+1)%$length))
fi

if [ "$1" == "MODE" ]
then
    echo $mode
	exit
elif [ -n "$1" ] && [ "$1" -eq "$1" ]
then
    if [ $1 -lt $length ]
	then
		index=$1
		echo "updating with index $index"
    else
		echo "your new index should be less than $length"
    fi
fi


xset s ${timeouts[${index}]}
xset dpms 0 0 ${timeouts[${index}]}

rm $file
touch $file
echo "mode='${modes[${index}]}'">>$file
echo "index=${index}">>$file

echo "Old mode: $mode"
echo "New mode: ${modes[index]}"

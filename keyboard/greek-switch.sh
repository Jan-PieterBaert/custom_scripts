#!/bin/bash

file=$HOME/.keyboard-mode

lang=$1

if [ "$lang" == "switch" ]; then
    # Do a switch
    old_lang=$(cat $file)
    if [ "$old_lang" == "us" ];then
        lang="gr"
    else
        lang="us"
    fi
fi

# Switch the keyboard layout of the external keyboard
declare -a keyboards=("SINO WEALTH USB KEYBOARD  " "SONiX USB DEVICE  ")
for KEYBOARD in "${keyboards[@]}"; do
    echo $KEYBOARD
    id=$(xinput -list | grep "$KEYBOARD" | grep -o "id=[0-9]*" | grep -o "[0-9]*")
    echo $id
    if [ "$id" != "" ];then
        if [ "$lang" == "gr" ];then
            setxkbmap -device $id -layout gr
        elif [ "$lang" == "us" ];then
            setxkbmap -device $id -layout us -variant altgr-intl
        fi;
    fi;
done

echo $lang > $file

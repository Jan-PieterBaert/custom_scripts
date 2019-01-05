#!/bin/bash

lock_file='/home/matthias/.screencast.lck'
audiodevice='alsa_output.usb-0d8c_C-Media_USB_Audio_Device-00.analog-stereo.monitor'

if [ -e "$lock_file" ]
then
	kill -SIGTERM $(cat "$lock_file")
	rm "$lock_file"
else
	dimensions=$( xrandr | grep '^Screen 0:' | sed 's/.*current \([0-9]*\) x \([0-9]*\),.*/\1x\2/' )
	filename=$( date "+/home/matthias/Video's/screencast_%Y-%m-%d_%H:%M:%S.mkv" )
	ffmpeg -f pulse -i $audiodevice -ac 2 -acodec vorbis -f x11grab -s $dimensions -i :0.0 -r 25 -vcodec libx264 -crf 0 -preset ultrafast $filename &
	echo $! > "$lock_file"
fi

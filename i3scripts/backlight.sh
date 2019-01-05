#!/bin/bash

echo "$(xbacklight -get)%"
# cat /sys/class/backlight/intel_backlight/actual_brightness | sed 's/^/100*/' | sed 's/$/\/937/' | bc | sed 's/$/%/'

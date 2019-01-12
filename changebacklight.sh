#!/bin/zsh

# Control screen brightness in a logarithmic fashion. Linear backlight control
# just annoys me: I want fine-grained control over low brightnesses and quickly
# change the value at high brightnesses.
#
# We assume the minimum brightness is 0 (light off) and the maximum brightness
# is 100. This is the behaviour of
# [acpilight](https://github.com/wavexx/acpilight/), a replacement for
# xorg-xbacklight (which doesn't work on my laptop for some reason).
#
# Use `backlight.sh up` or `backlight.sh down` to increase or decrease the
# backlight brightess. If you want to adjust the speed with which it changes,
# adjust `change_percent` below.


# Multiply the current brightness by this percentage. This has to be an integer
change_percent=125

# Don't start a new transition if the previous one isn't done yet
pgrep -u $UID -x xbacklight >/dev/null && exit

# Calculate new target brightness
current_brightness=$(xbacklight -get | grep -o "^.*\." | grep -o "[0-9]*")
case $1 in
	up)	
		target=$((current_brightness * $change_percent / 100+5))
		[ $((target)) -ne $((current_brightness)) ] || target=$((target))
		;;
	down)
		target=$((current_brightness * 100 / $change_percent))
		[ $target -ne $current_brightness ] || target=$((target - 1))
		;;
esac

# Boundaries: can't go higher than 100% or lower than 1%
[ $target -le 1   ] && target=1
[ $target -ge 100 ] && target=100

# Smoothly set the new brightness
xbacklight -time 10 -set $target


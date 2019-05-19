#!/bin/ksh

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
change_percent=120.0

# Don't start a new transition if the previous one isn't done yet
#pgrep -u $UID -x xbacklight >/dev/null && exit

# Calculate new target brightness
current_brightness=$(light -G)
case $1 in
	up)
		target=$((current_brightness * $change_percent / 100.0))
		[ $((target)) -ne $((current_brightness)) ] || target=$((target))
		;;
	down)
		target=$((current_brightness * 100.0 / $change_percent))
    [ $((target)) -ne $((current_brightness)) ] || target=$((target - 1.0))
		;;
esac

# Boundaries: can't go higher than 100% or lower than 1%
#[ $target -le 1   ] && target=1
#[ $target -ge 100 ] && target=100

#if [ $((target)) -gt 100.0 ]; then target=100.0; fi
#if [ $((target)) -lt 0.0 ]; then target=0.0; fi

#echo $target

# Smoothly set the new brightness
light -S "$target"


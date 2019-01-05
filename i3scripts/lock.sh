#!/bin/bash

img="/tmp/lock-screen.png"

escrotum "$img"
convert "$img" -blur 0x5 "$img"
i3lock -i "$img"

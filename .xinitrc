#!/bin/sh

feh --bg-scale /home/irakli/Pictures/ocean.jpg

dwmblocks &
dunst &
nm-applet &
~/.config/i3/battery_ctl/battery_ctl &
clipit -n &
xclip &
# picom --experimental-backends &
redshift &

discord --start-minimized &

exec dwm

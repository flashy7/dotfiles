#!/bin/sh

feh --bg-scale /home/irakli/Pictures/tree.jpg

dwmblocks &
dunst &
nm-applet &
~/.config/i3/battery_ctl/battery_ctl &
clipit -n &
xclip &
# picom &
redshift &

# discord --start-minimized &

exec dwm

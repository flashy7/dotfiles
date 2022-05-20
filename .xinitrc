#!/bin/sh

feh --bg-scale ~/Pictures/tree.jpg

dwmblocks &
dunst &
nm-applet &
~/.config/i3/battery_ctl/battery_ctl &
clipit -n &
xclip &
redshift &

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# discord --start-minimized &
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Scrolling Pixel Distance" 10

exec dwm

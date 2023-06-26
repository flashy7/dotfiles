#!/bin/sh

feh --bg-scale ~/Pictures/tree.jpg

dwmblocks &
dunst &
nm-applet &
# ~/.config/i3/battery_ctl/battery_ctl &
clipit -n &
xclip &
# redshift &

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# discord --start-minimized &
xinput set-prop 'ELAN0415:00 04F3:3162 Touchpad' "libinput Natural Scrolling Enabled" 1
xinput set-prop 'ELAN0415:00 04F3:3162 Touchpad' "libinput Scrolling Pixel Distance" 10
xinput set-prop 'ELAN0415:00 04F3:3162 Touchpad' 'libinput Tapping Enabled' 1

/usr/bin/prime-offload

exec dwm
# exec cinnamon-session

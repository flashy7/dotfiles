#!/bin/sh

feh --bg-scale ~/Pictures/current

dwmblocks &
dunst &
nm-applet &
pasystray &
clipit -n &
xclip &
xrdb "$HOME/.Xresources"

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

monitor

exec dwm

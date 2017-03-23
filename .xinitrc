#!/bin/bash

#
# ~/.xinitrc
#
# Executed by startx
#

wmname LG3D
xrandr --output HDMI-0 --primary --left-of DVI-I-1
feh --bg-center ~/pictures/road.jpg
xsetroot -cursor_name left_ptr
xrdb -merge "${HOME}/.Xdefaults"
#trayer --edge top --align right --distance 225 --distancefrom right --SetDockType true --SetPartialStrut true --expand true --width 10.5 --transparent true --expand false --alpha 0 --tint 0x000000  --height 19 --monitor "primary" &
exec i3
exec dunst -conf ~/.dunstrc

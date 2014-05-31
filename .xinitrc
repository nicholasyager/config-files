#!/bin/bash

#
# ~/.xinitrc
#
# Executed by startx
#

wmname LG3D
feh --bg-fill Pictures/aperture.jpg
xsetroot -cursor_name left_ptr
#trayer --edge top --align right --distance 225 --distancefrom right --SetDockType true --SetPartialStrut true --expand true --width 10.5 --transparent true --expand false --alpha 0 --tint 0x000000  --height 19 --monitor "primary" &
exec xmonad


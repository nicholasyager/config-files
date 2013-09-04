#!/bin/bash

#
# ~/.xinitrc
#
# Executed by startx
#

wmname LG3D
feh --bg-fill Pictures/aperture.jpg
xsetroot -cursor_name left_ptr
exec xmonad

config-files
============

.X, xmobar, and xmonad configuration files, and associated scripts to get the desired effects.

Installation
-----
Place appropriate symbolic links in the home directory, .vim, and .xmonad folders,
then restart X11 to verify that everything works.

Scripts:
-----
 - *power.sh*: Read battery attributes and notify the user as per
   applicable. This script requires libnotify and a notification daemon such as notify-osd.
 - *volume.sh*: Read the computer volume via alsa and print it to the STDOUT.

#!/bin/bash

stat=$(cat /sys/class/power_supply/BAT1/status)
cap=$(cat /sys/class/power_supply/BAT1/capacity)

if [ $cap -lt 10 ]; then
    notify-send 'Power notification' 'You are low on power. Shutdown iminient!' --icon=dialog-warning
fi

if [ $cap -lt 5 ]; then
    shutdown now;
fi

echo $stat $cap%

exit 0

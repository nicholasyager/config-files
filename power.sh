#!/bin/bash

stat=$(cat /sys/class/power_supply/BAT1/status)
cap=$(cat /sys/class/power_supply/BAT1/capacity)


if [ $stat == "Discharging"]; then
    if [ $cap -lt 20 ]; then
        notify-send 'Power notification' 'You are low on power. Shutdown iminient!' --icon=dialog-warning
    fi

    if [ $cap -lt 6 ]; then
        /usr/bin/systemctl suspend 
    fi
fi

echo $stat $cap%

exit 0

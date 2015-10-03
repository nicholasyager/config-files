#!/bin/bash

stat_orig=$(acpi | awk '{print $3}')
stat="${stat_orig%?}"
cap=$(cat /sys/class/power_supply/BAT1/capacity)
time=$(acpi | awk '{print $5}')


stat_short="Chg"
if [ $stat == "Discharging" ]; then

    stat_short="Dschg"

    if [ $cap -lt 20 ]; then
        if [ $cap -gt 15 ]; then
            notify-send "Low Power notification" "Your battery is down to $cap%." --icon=battery-low
        fi
    fi

    if [ $cap -lt 15 ]; then
        notify-send "Low Power notification" "Your battery is down to $cap%. Shutdown imminent!" --icon=battery-caution
    fi


    if [ $cap -lt 9 ]; then
        shutdown now
    fi

fi

echo $stat_short $cap% $time

exit 0

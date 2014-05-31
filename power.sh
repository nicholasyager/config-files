#!/bin/bash

stat=$(cat /sys/class/power_supply/BAT1/status)
cap=$(cat /sys/class/power_supply/BAT1/capacity)
energy=$(cat /sys/class/power_supply/BAT1/energy_now)
currenttime=$(date +"%s")
history=$(cat ~/.bin/power.history)

# Parse the power history
IFS=';' read -ra HIST <<< $history
let iter=0
for i in ${HIST[@]}; do
    if [ $iter -eq 0 ]; then
        histtime=$i
    fi

    if [ $iter -eq 1 ]; then
        histenergy=$i
    fi
    let iter++
done


if [ $stat == "Discharging" ]; then

    timechange=$(echo "$currenttime-$histtime" | bc -l )
    energychange=$(echo "$histenergy-$energy" | bc -l)
    rate=$( echo "$energychange / $timechange" | bc -l)
    timeremaining=$( echo "18000 + $energy / $rate " | bc -l)
    end=$(date --date="@$timeremaining" +"%H:%M:%S")

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

    echo "$currenttime;$energy" > power.history

fi

echo $stat $cap% $end

exit 0

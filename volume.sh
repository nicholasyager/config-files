#!/bin/bash
vol=$(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2/10 }}' | head -n 1)

cleanvol=$(echo $vol | tr -d '.')

if [ $cleanvol == '10']; then
    cleanvol=100
fi

echo Vol: $cleanvol

exit 0

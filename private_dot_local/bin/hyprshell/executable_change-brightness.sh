#!/usr/bin/env bash
notificationDuration=1000

if [[ $1 -gt 0 ]]; then
    brightnessctl set "+$1%"
elif [[ $1 -lt 0 ]]; then
    brightnessctl set "$((-$1))%-"
fi

notify-send -e -i " " -h string:x-canonical-private-synchronous:osd -t $notificationDuration -u low "󰖨  $(echo "scale=0; $(brightnessctl g) * 100 / $(brightnessctl m)" | bc)%"


#!/bin/bash
newBrightness="$(($(brightnessctl get -P) + $1))"
notificationDuration=1000

brightnessctl set "$newBrightness%"
newBrightness=$(brightnessctl get -P)

notify-send -e -h string:x-canonical-private-synchronous:osd -t $notificationDuration -u low  " $newBrightness%"

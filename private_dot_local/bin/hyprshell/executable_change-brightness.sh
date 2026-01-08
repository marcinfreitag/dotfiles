#!/usr/bin/env bash
notificationDuration=1000

newBrightness="$(($(brightnessctl get -P) + $1))"

brightnessctl set "$newBrightness%"
newBrightness=$(brightnessctl get -P)

notify-send -e -i " " -h string:x-canonical-private-synchronous:osd -t $notificationDuration -u low "󰖨  $newBrightness%"

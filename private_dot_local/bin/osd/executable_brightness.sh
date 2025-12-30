#!/usr/bin/env bash
newBrightness="$(($(brightnessctl get -P) + $1))"
notificationDuration=2000

brightnessctl set "$newBrightness%"
newBrightness=$(brightnessctl get -P)

notify-send -e -h string:x-canonical-private-synchronous:osd -t $notificationDuration -u low -i ~/.icons/display-brightness-symbolic.svg "Brightness" "$newBrightness%"

#!/usr/bin/env bash
notificationDuration=1000

newBrightness="$(($(printf "%.0f" $(light -G)) + $1))"
light -S $newBrightness
newBrightness=printf "%.0f" $(light -G)

notify-send -e -i " " -h string:x-canonical-private-synchronous:osd -t $notificationDuration -u low "󰖨  $newBrightness%"

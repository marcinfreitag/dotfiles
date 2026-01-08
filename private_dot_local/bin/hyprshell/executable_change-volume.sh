#!/usr/bin/env bash
notificationDuration=1000
#iconPath="$HOME/.icons"

newVolume=$(echo "$(echo "$(wpctl get-volume @DEFAULT_SINK@)" | cut -d' ' -f2) + $1 * 0.01" | bc)

if [ 1 -eq "$(echo "$newVolume > 1.5" | bc)" ]; then
  newVolume=1.5
elif [ 1 -eq "$(echo "$newVolume < 0" | bc)" ]; then
  newVolume=0
fi

wpctl set-volume @DEFAULT_AUDIO_SINK@ $newVolume -l 1.5

notify-send -e -i " " -h string:x-canonical-private-synchronous:osd -t $notificationDuration -u low "  $(echo "scale=0; $newVolume * 100 /1" | bc)%"

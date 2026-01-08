#!/usr/bin/env bash
notificationDuration=1000
#iconPath="$HOME/.icons"

volumeDump=$(wpctl get-volume @DEFAULT_SINK@)

if [ -z "$(echo "$volumeDump" | cut -d' ' -f3)" ]; then
  newVolumeToggleState="Muted"
  newVolumeState=""
else
  newVolumeToggleState="Unmuted"
  newVolumeState=" "
fi

wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

notify-send -e -i " " -h string:x-canonical-private-synchronous:osd -t $notificationDuration -u low "$newVolumeState  $newVolumeToggleState"

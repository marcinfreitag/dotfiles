#!/usr/bin/env bash
notificationDuration=1000

volumeDump=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)

if [ -z "$(echo "$volumeDump" | cut -d' ' -f3)" ]; then
  newVolumeToggleState="Muted"
  newVolumeState=""
else
  newVolumeToggleState="Unmuted"
  newVolumeState=""
fi

wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

notify-send -e -h string:x-canonical-private-synchronous:osd -t $notificationDuration -u low "$newVolumeState  $newVolumeToggleState"

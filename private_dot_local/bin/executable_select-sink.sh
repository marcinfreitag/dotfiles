#!/bin/bash

pactl set-default-sink "$(pactl list short sinks | awk '{print $2}' | wofi -d -lines 5 -p "Select default audio sink:")" && notify-send "Audio switched!" || exit 0


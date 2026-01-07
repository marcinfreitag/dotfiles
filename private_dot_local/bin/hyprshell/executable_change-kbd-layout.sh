#!/usr/bin/env bash
notificationDuration=1000
#iconPath="$HOME/.icons"

hyprctl switchxkblayout all next

#notify-send -e -h string:x-canonical-private-synchronous:osd -t $notificationDuration -u low  -i "$iconPath/input-keyboard-symbolic.svg" "Keyboard" "Layout: $(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')"
notify-send -e -h string:x-canonical-private-synchronous:osd -t $notificationDuration -u low  "   $(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')"


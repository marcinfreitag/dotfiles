#!/usr/bin/env bash
notificationDuration=2000

hyprctl switchxkblayout all next

notify-send -e -h string:x-canonical-private-synchronous:osd -t $notificationDuration -u low  -i ~/.icons/input-keyboard-symbolic.svg "Keyboard" "Layout: $(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')"

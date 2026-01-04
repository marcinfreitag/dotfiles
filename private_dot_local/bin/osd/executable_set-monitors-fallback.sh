#!/usr/bin/env bash
notificationDuration=1000
#iconPath="$HOME/.icons"

pushd ~/.config/hypr/modules/ 
ln -sf monitors-fallback.conf monitors.conf
popd

#notify-send -e -h string:x-canonical-private-synchronous:osd -t $notificationDuration -u low  -i "$iconPath/video-display-symbolic.svg" "Display" "Restore fallback settings"
notify-send -e -h string:x-canonical-private-synchronous:osd -t $notificationDuration -u low  "󰍹  Restore fallback settings"

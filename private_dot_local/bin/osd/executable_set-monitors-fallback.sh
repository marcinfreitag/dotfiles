#!/usr/bin/env bash
notificationDuration=2000

pushd ~/.config/hypr/modules/ 
ln -sf monitors-fallback.conf monitors.conf
popd

notify-send -e -h string:x-canonical-private-synchronous:osd -t $notificationDuration -u low  -i ~/.icons/video-display-symbolic.svg "Set monitor fallback settings"

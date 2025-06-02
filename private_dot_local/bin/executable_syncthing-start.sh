#!/bin/bash

if [ "$(pidof syncthing)" == "" ]; then
    syncthing --no-browser &
    notify-send -t 2000 -i ~/.icons/syncthing.svg "SyncThing" "Daemon started"
    exit 1
else
    notify-send -t 2000 -i ~/.icons/syncthing.svg "SyncThing" "Daemon already running"
    exit 0
fi




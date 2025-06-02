#!/bin/bash

if [ "$(pidof syncthing)" == "" ]; then
    notify-send -t 2000 -i ~/.icons/syncthing.svg "SyncThing" "Daemon not running"
    exit 1
else
    pids=( $(pgrep -f syncthing) )
    for pid in "${pids[@]}"; do
        if [[ $pid != $$ ]]; then
            kill "$pid"
        fi
    done

	notify-send -t 2000 -i ~/.icons/syncthing.svg "SyncThing" "Daemon stopped"
    exit 0
fi



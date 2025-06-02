#!/bin/bash

if [ "$(pgrep generalsync)" == "" ]; then
    notify-send -t 2000 -i ~/.icons/generalsync.png "GeneralSync" "Daemon not running"
    exit 1
else
    pids=( $(pgrep -f generalsync) )
    for pid in "${pids[@]}"; do
        if [[ $pid != $$ ]]; then
            kill "$pid"
        fi
    done

	notify-send -t 2000 -i ~/.icons/generalsync.png "GeneralSync" "Daemon stopped"
    exit 0
fi



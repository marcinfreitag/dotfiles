#!/bin/bash

if [ "$(pgrep generalsync)" == "" ]; then
	pushd ~/.local/bin/general-sync/
    ~/.local/bin/general-sync/generalsync --daemon &
    popd
    notify-send -t 2000 -i ~/.icons/generalsync.png "GeneralSync" "Daemon started"
    exit 0
else
    notify-send -t 2000 -i ~/.icons/generalsync.png "GeneralSync" "Daemon already running"
    exit 1
fi



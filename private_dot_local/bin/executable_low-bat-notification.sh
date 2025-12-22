#!/bin/bash
# stolen from Stephan Raabe's My Linux for Work dotfiles 
# replaced magic numbers with WARN and CRIT

BAT=$(command ls -d /sys/class/power_supply/BAT* 2>/dev/null | head -n 1)
if [[ -z "$BAT" ]]; then
    exit 0
fi

warnLevel=20
critLevel=10

NOTIFIED_WARN=false
NOTIFIED_CRIT=false

while true; do
    CAPACITY=$(cat "$BAT/capacity")
    STATUS=$(cat "$BAT/status")

    if [[ "$STATUS" == "Discharging" ]]; then
        if [[ $CAPACITY -le $critLevel && $NOTIFIED_CRIT == false ]]; then
            notify-send -u critical "Battery Low" "Remaining: ${CAPACITY}%"
            NOTIFIED_CRIT=true
        elif [[ $CAPACITY -le $warnLevel && $CAPACITY -gt 5 && $NOTIFIED_WARN == false ]]; then
            notify-send -u normal "Battery Low" "Remaining: ${CAPACITY}%"
            NOTIFIED_WARN=true
        elif [[ $CAPACITY -gt 20 ]]; then
            NOTIFIED_WARN=false
            NOTIFIED_CRIT=false
        fi
    else
        NOTIFIED_WARN=false
        NOTIFIED_CRIT=false
    fi

    sleep 60
done

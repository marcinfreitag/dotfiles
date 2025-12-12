#!/bin/bash

iconDir=/usr/share/icons/Adwaita/symbolic/status
notification_timeout=1000
step=5

getBrightness() {
    brightnessctl -m | cut -d, -f4 | sed 's/%//'
}

displayOSD() {
    notify-send -e -h string:x-canonical-private-synchronous:osd -h int:value:$current -u low -i "$iconDir/display-brightness-symbolic.svg" "Brightness" "$current%"
}

changeBrightness() {
    local currentBrightness=$(getBrightness)

    if [[ "$1" == "+${step}%" ]]; then
        newBrightness=$((currentBrightness + step))
    elif [[ "$1" == "${step}%-" ]]; then
        newBrightness=$((currentBrightness - step))
    fi

    if [[ newBrightness < 0 ]]; then
        newBrigtness=0
    elif [[ newBrightness > 100 ]]; then
        newBrigtness=100
    fi

    current=newBrightness

    brightnessctl set "${newBrightness}%"
    displayOSD
}

case "$1" in
    "--inc")
        changeBrightness "+${step}%"
    ;;
    "--dec")
        changeBrightness "${step}%-"
    ;;
    "--get")
        getBrightness
        ;;
    *)
        getBrightness
        ;;
esac




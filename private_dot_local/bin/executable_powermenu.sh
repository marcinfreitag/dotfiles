#!/bin/bash

# options to be displayed
option0="lock"
option1="exit"
option2="suspend"
option3="reboot"
option4="shutdown"

# options passed into variable
options="$option0\n$option1\n$option2\n$option3\n$option4"

#chosen="$(echo -e "$options" | rofi -lines 8 -dmenu -p "power")"
chosen="$(echo -e "$options" | wofi -d -lines 5 -p "Power Menu")"
case $chosen in
    $option0)
        loginctl lock-session;;
    $option1)
        loginctl terminate-user $USER;;
    $option2)
        systemctl suspend;;
    $option3)
        systemctl reboot;;
	$option4)
        systemctl poweroff;;
esac

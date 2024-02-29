#!/bin/bash

text_scaling_factor=$(gsettings get org.gnome.desktop.interface text-scaling-factor)

if [ $text_scaling_factor == 1.0 ]; then
	gsettings set org.gnome.desktop.interface text-scaling-factor 1.25
elif [ $text_scaling_factor == 1.25 ]; then
	gsettings set org.gnome.desktop.interface text-scaling-factor 1.48
fi

unset text_scaling_factor



#!/bin/bash
#
# debloat-fedora.sh
#

gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Welcome to *$(basename $0)*!"

if ! gum confirm "Do you want to debloat fedora now?"; then
    echo -e "\n:: Debloating canceled."
    exit;
fi

echo -e "\n:: Debloating started."
sudo gum spin --spinner dot --title "Removing Fedora packages..." -- dnf -y remove abrt-desktop baobab fedora-bookmarks geary gnome-boxes gnome-calendar gnome-contacts gnome-logs gnome-maps gnome-software gnome-tour gnome-weather mediawriter ibus-anthy ibus-hangul ibus-libpinyin ibus-libzhuyin totem
echo -e "\n:: Debloating done. Press [ENTER] to close."
read






                           

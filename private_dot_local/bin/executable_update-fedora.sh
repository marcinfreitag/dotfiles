#!/bin/bash
#
# update-fedora.sh
#

gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Welcome to *$(basename $0)*!"

if ! gum confirm "Do you want to update fedora now?"; then
    echo -e "\n:: Update canceled."
    exit;
fi

echo -e "\n:: Update started."
sudo gum spin --spinner dot --title "Updating Fedora packages..." -- dnf -y upgrade --refresh
gum spin --spinner dot --title "Updating flatpak packages..." -- flatpak update --noninteractive
echo -e "\n:: Update done. Press [ENTER] to close."
read






                           

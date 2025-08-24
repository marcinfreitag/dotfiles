#!/bin/bash
#
# update-fedora.sh
#

gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Welcome to $(basename $0)!"

if ! gum confirm "Do you want to update fedora now?"; then
    echo -e "\n:: Update canceled."
    exit;
fi

echo -e "\n:: Update started."
echo "Updating Fedora packages..."
sudo dnf -y upgrade --refresh
echo "Updating flatpak packages..."
flatpak update --noninteractive

echo -e "\n:: Done. Press [ENTER] to close."
read







                           

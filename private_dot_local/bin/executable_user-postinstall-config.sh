#!/bin/bash
#
# update-fedora.sh
#

gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Welcome to $(basename $0)!"

if ! gum confirm "Do you want to run postinstall config (do it only once)"; then
    echo -e "\n:: Task canceled."
    exit;
fi

echo -e "\n:: Config started."
# sudo gum spin --spinner dot --title "Updating Fedora packages..." -- dnf -y upgrade --refresh
ln -s ~/syncthing/camera/ ~/Pictures/camera
ln -s ~/syncthing/whatsapp-media/WhatsApp\ Documents/ ~/Documents/whatsapp
ln -s ~/syncthing/whatsapp-media/WhatsApp\ Images/ ~/Pictures/whatsapp
ln -s ~/syncthing/whatsapp-media/WhatsApp\ Video/ ~/Videos/whatsapp

echo -e "\n:: Done. Press [ENTER] to close."
read







                           

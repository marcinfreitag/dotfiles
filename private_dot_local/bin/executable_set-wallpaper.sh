#!/bin/bash
#
# set-wallpaper.sh - sets wallpaper on hyprland
#

gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Welcome to $(basename $0)!"

if ! gum confirm "Do you want to change wallpaper?"; then
    echo -e "\n:: Changing wallpaper canceled."
    exit;
fi

# Replace current.jpg with a new one, refresh current wallpaper, generate color palette
current_wallpaper=$HOME/.local/share/wallpapers/current.jpg
cp -f $(gum file "$HOME/.local/share/wallpapers/") "$current_wallpaper"

if [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload $current_wallpaper
    hyprctl hyprpaper wallpaper ", $current_wallpaper"
fi
# This is not required, if executed at least once
gsettings set org.gnome.desktop.background picture-uri "file://$current_wallpaper"

wal -c > /dev/null
wal -q -i $current_wallpaper >/dev/null 2>&1
source "$HOME/.cache/wal/colors.sh"

# Display new terminal colour scheme
echo -e "\n:: $(wal --preview)"

echo -e "\n:: Done. Press [ENTER] to close."
read

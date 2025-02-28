#!/bin/bash
#
# disable-psr.sh - fixes input lag on ThinkPad X280 by disabling PSR
#

# removes and adds a kernel parameter to disble psr (run this with sudo)
disable_psr() {
    grubby --remove-args="i915.enable_psr=0" --update-kernel=ALL
	grubby --args="i915.enable_psr=0" --update-kernel=ALL
}

export -f disable_psr

gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Welcome to $(basename $0)!"

if ! gum confirm "Do you want to disable PSR? This fixes input lag on ThinkPad X280."; then
    echo -e "\n:: Task canceled."
    exit;
fi

echo -e "\n:: Disable PSR started."
sudo gum spin --spinner dot --title "Disabling PSR..." -- bash -c "$(declare -f disable_psr); disable_psr"

echo -e "\n:: Done. Press [ENTER] to close."
read




                           

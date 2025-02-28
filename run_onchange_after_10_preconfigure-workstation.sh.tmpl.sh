#!/bin/bash

gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Workstation pre-configuration"

# Fix input lag on Thinkpad X280
# private_dot_local/bin/executable_disable-psr.sh hash: {{ include "private_dot_local/bin/executable_disable-psr.sh" | sha256sum }}
/home/$USER/.local/bin/disable-psr.sh

# Debloat system
# private_dot_local/bin/executable_debloat-fedora.sh hash: {{ include "private_dot_local/bin/executable_debloat-fedora.sh" | sha256sum }}
/home/$USER/.local/bin/debloat-fedora.sh

echo ":: Installing language support for flatpaks"
sudo flatpak config --set languages "en;de;pl;fr;nl"


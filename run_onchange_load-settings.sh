#!/bin/bash

echo "Enabling gpg-agent"
systemctl --user enable --now gpg-agent.socket
systemctl --user enable --now gpg-agent-ssh.socket

echo "Setting default browser"
xdg-settings set default-web-browser brave-browser.desktop

echo "Loading dconf settings"
cat ~/.local/share/chezmoi/provisioning/dconf-settings.ini | dconf load /

#!/bin/bash

echo "Removing unneeded software packages"
sudo dnf -y remove baobab gnome-abrt gnome-logs gnome-maps gnome-tour gnome-weather mediawriter totem
sudo dnf -y autoremove

echo "Updating system"
sudo dnf -y update; flatpak update

echo "Adding package repos"
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

echo "Installing non-free codecs"
sudo dnf -y group upgrade --with-optional --allowerasing Multimedia

echo "Installing software packages"
sudo dnf -y install celluloid clamav dconf-editor flatseal geary gimp gnome-shell-extension-caffeine gnome-extensions-app htop inkscape lynis neofetch mpv neovim pass pass-otp syncthing tldr zbar https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm brave-browser

echo "Installing language support for rpms"
sudo dnf -y install langpacks-de langpacks-fr langpacks-nl langpacks-pl

echo "Installing language support for flatpaks"
sudo flatpak config --set languages "en;de;pl;fr;nl"

echo "Enabling gpg-agent"
systemctl --user enable --now gpg-agent.socket
systemctl --user enable --now gpg-agent-ssh.socket

echo "Setting text-scaling"
gsettings set org.gnome.desktop.interface text-scaling-factor 1.48

echo "Setting default browser"
xdg-settings set default-web-browser brave-browser.desktop

echo "Setting tap to click"
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

echo "Seting compose key to CapsLock"
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:caps']"

echo "Setting power button to shut down"
gsettings set org.gnome.settings-daemon.plugins.power power-button-action interactive

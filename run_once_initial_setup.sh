#!/bin/bash

echo "Removing unneeded software packages"
sudo dnf -y remove baobab gnome-abrt gnome-logs gnome-maps gnome-tour gnome-weather mediawriter totem && sudo dnf -y autoremove

echo "Adding package repos"
if [ ! -f /etc/yum.repos.d/rpmfusion-free.repo ]; then
    sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
fi
if [ ! -f /etc/yum.repos.d/rpmfusion-nonfree.repo ]; then
    sudo dnf -y install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
fi
if [ ! -f /etc/yum.repos.d/brave-browser.repo ]; then
    sudo dnf -y config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
	sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
fi
if [ ! -f /etc/yum.repos.d/teamviewer.repo ]; then
	sudo dnf -y config-manager --add-repo .local/share/chezmoi/provisioning/teamviewer.repo
	sudo rpm --import https://linux.teamviewer.com/pubkey/currentkey.asc
fi


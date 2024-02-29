#!/bin/bash

echo "Removing unneeded software packages"
sudo dnf -y remove baobab gnome-abrt gnome-logs gnome-maps gnome-tour gnome-weather mediawriter totem && sudo dnf -y autoremove

echo "Adding package repos"
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf -y config-manager --add-repo .local/share/chezmoi/provisioning/teamviewer.repo
sudo rpm --import https://linux.teamviewer.com/pubkey/currentkey.asc

echo "Upgrading system"
sudo dnf -y clean all && sudo dnf -y group upgrade --with-optional --allowerasing Multimedia && sudo dnf -y upgrade --refresh
~/.local/bin/update-fedora.sh -y

echo "Installing software packages"
sudo dnf -y install celluloid clamav dconf-editor flatseal geary gimp gnome-shell-extension-caffeine gnome-shell-extension-no-overview gnome-extensions-app htop inkscape langpacks-de langpacks-fr langpacks-nl langpacks-pl lynis neofetch mpv neovim pass pass-otp syncthing tldr zbar teamviewer  brave-browser
sudo dnf -y install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

echo "Installing language support for flatpaks"
sudo flatpak config --set languages "en;de;pl;fr;nl"

echo "Running update, just to make shure"
~/.local/bin/update-fedora.sh -y

echo "Enabling gpg-agent"
systemctl --user enable --now gpg-agent.socket
systemctl --user enable --now gpg-agent-ssh.socket

echo "Setting default browser"
xdg-settings set default-web-browser brave-browser.desktop

echo "Loading dconf settings"
cat ~/.local/share/chezmoi/provisioning/dconf-settings.ini | dconf load /

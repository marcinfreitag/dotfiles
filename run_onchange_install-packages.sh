#!/bin/bash

echo "Upgrading system"
sudo dnf -y clean all && sudo dnf -y group upgrade --with-optional --allowerasing Multimedia && sudo dnf -y upgrade --refresh
~/.local/bin/update-fedora.sh -y

echo "Installing software packages"
sudo dnf -y install age celluloid clamav dconf-editor flatseal geary gimp gnome-shell-extension-caffeine gnome-shell-extension-no-overview gnome-extensions-app htop inkscape langpacks-de langpacks-fr langpacks-nl langpacks-pl lynis neofetch mpv neovim pass pass-otp syncthing tldr zbar teamviewer  brave-browser
sudo dnf -y install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

echo "Installing language support for flatpaks"
sudo flatpak config --set languages "en;de;pl;fr;nl"


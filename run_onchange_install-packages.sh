#!/bin/bash

echo "Upgrading system"
sudo dnf -y clean all && sudo dnf -y group upgrade --with-optional --allowerasing Multimedia
~/.local/bin/update-fedora.sh -y

echo "Installing software packages"
sudo dnf -y install age celluloid clamav dconf-editor flatseal geary gimp gnome-shell-extension-caffeine gnome-shell-extension-no-overview gnome-extensions-app htop inkscape langpacks-de langpacks-fr langpacks-nl langpacks-pl lynis neofetch mpv neovim pass pass-otp syncthing tldr zbar teamviewer  brave-browser
sudo dnf -y install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

echo "Installing language support for flatpaks"
sudo flatpak config --set languages "en;de;pl;fr;nl"

# install alienfx
pc_make=$(sudo dmidecode -s system-product-name)

if [[ $pc_make == *'Alienware '* ]]; then
	echo "Installing alienfx-gtk"
	sudo dnf -y install cairo-devel python3-future python3-pyusb gobject-introspection gtk3-devel
	mkdir ~/.local/src
	pushd ~/.local/src
	git clone https://github.com/trackmastersteve/alienfx.git
	pushd alienfx
	sudo python3 setup.py install && sudo python3 setup.py install_data
	popd; popd
fi


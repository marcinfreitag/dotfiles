#!/bin/bash

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

# fix input lag on thinkpad X280
pc_make=$(sudo dmidecode -s system-version)
if [[ $(sudo dmidecode -s system-version) == "ThinkPad X280" ]]; then
	sudo grubby --remove-args="i915.enable_psr=0" --update-kernel=ALL
	sudo grubby --args="i915.enable_psr=0" --update-kernel=ALL
fi

unset pc_make
swtpm --create-config-files skip-if-exist
sudo dnf copr enable jstaf/onedriver
sudo dnf install onedriver

ansible-playbook ~/.config/install-packages.yml --ask-become-pass

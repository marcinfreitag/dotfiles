#!/bin/bash

# installs nvidia drivers
# https://www.reddit.com/r/Fedora/comments/18bj1kt/fedora_nvidia_secure_boot/?rdt=40579

script_full_path=$(realpath "$0")
autostart_dir=~/.config/autostart
autostart_full_path="$autostart_dir/setup-workstation.desktop"
stage=0

function create_autostart_entry() {
	mkdir -p $autostart_dir
	cat <<- EOF > "$autostart_full_path"
	[Desktop Entry]
	Name=Install NVIDIA. Stage $1
	Comment=Configure system and set up software on the fedora workstation
	Exec=gnome-terminal -e "$script_full_path -s $1"
	Icon=org.gnome.Terminal
	Type=Application
	StartupNotify=true
	StartupWMClass=Gnome-terminal
	SingleMainWindow=false
	X-ExecArg=--
	EOF
}

function remove_autostart_entry() {
	rm -f $autostart_full_path
}

function usage() { echo "Usage: $0 [-s <1|2|3>]" 1>&2; exit 1; }

while getopts "s:" options; do
    case "${options}" in
        s)
            stage=${OPTARG}
            ((stage == 1 || stage == 2 || stage ==3 )) || usage
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${stage}" ]; then
    usage
fi

case $stage in
	1)
		# if no NVIDIA card detected, abort
		if [[ ! "$(lspci | grep -i VGA | grep -i NVIDIA)" =~ .*NVIDIA.* ]]; then
			echo "No NVIDIA card detected. Abort."
			exit 1
		fi
		echo "NVIDIA detected, performing setup"
		sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
		sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
		~/.local/bin/update-fedora.sh
		create_autostart_entry 2

		echo "Check the setup result and reboot"
		exit 0
		;;
	2)
		remove_autostart_entry
		#sudo mokutil --reset
		sudo dnf install kmodtool akmods mokutil openssl
		sudo kmodgenca -a 
		sudo mokutil --import /etc/pki/akmods/certs/public_key.der
		create_autostart_entry 3
		echo "Check the setup result, reboot and enroll the key"
		exit 0
		;;
	3)
		remove_autostart_entry
		sudo dnf -y remove akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686
		sudo dnf -y install akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686
		exit 0
		;;
esac

usage


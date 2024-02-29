#!/bin/bash

usage() {
    echo -e "Usage: $0 [-y]\n$0 update system interactively\n$0 -y update system noninteractively (assume 'yes' as answer)" 1>&2;
    exit 1;
}

# parameters for noninteractive setup
yes_dnf=""
yes_flatpak=""

while getopts "y" options; do
    case "${options}" in
        y)
            if [ ! -z "${OPTARG}" ] ; then
                usage
            fi
            yes_dnf="-y"
            yes_flatpak="--noninteractive"
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))


sudo dnf $yes_dnf update
flatpak update $yes_flatpak


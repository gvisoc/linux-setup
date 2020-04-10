#!/bin/bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

# PPA for elementary-tweaks (dark theme & other tweaks)
add-apt-repository ppa:philip.scott/elementary-tweaks

apt update

# Enable dark theme / theming in elementary OS
apt -y install software-properties-common
apt -y install elementary-tweaks

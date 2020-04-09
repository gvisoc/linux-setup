#!/bin/bash
USER=`id -nu`

ORIG_DIR=`pwd`
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi


apt-get update
apt-get -y autoremove
apt-get -y upgrade

# Basic build tools
apt -y install git gcc binutils make xclip

# Snap
apt -y install snapd
apt -y install git libcurl4-openssl-dev libsqlite3-dev pkg-config
snap install --classic dmd 
snap install --classic dub

echo "Snap packages won't be recogenized unless we reboot. Reboot the machine and run ./setup-onedrive-2.sh" 

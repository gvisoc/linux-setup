#!/bin/bash
USER=`id -nu`

ORIG_DIR=`pwd`
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi



mkdir -p ~/.setup-tmp
cd ~/.setup-tmp

add-apt-repository ppa:linuxuprising/apps
add-apt-repository ppa:philip.scott/elementary-tweaks

apt update
apt -y upgrade
apt -y autoremove

apt -y install tlp tlpui tp-smapi-dkms acpi-call-dkms tlp-rdw
apt -y install software-properties-common
apt -y install elementary-tweaks

#!/bin/bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

# PPA for TLPUI
add-apt-repository ppa:linuxuprising/apps 

# PPA for elementary-tweaks (dark theme & other tweaks)
add-apt-repository ppa:philip.scott/elementary-tweaks

apt update

# Power management for Thinkpad Laptops
apt -y install tlp tlpui tp-smapi-dkms acpi-call-dkms tlp-rdw

# Enable dark theme / theming in elementary OS
apt -y install software-properties-common
apt -y install elementary-tweaks

# Browser of reference
apt -y install firefox

# Backup utility a la Time Machine with support for NFS Mounts
apt -y install backintime backintime-gnome nfs-common encfs

# Command line utility to interact with the clipboards
apt -y install xclip xsel
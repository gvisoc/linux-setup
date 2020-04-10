#!/bin/bash

# THIS IS SPECIFIC FOR THINKPAD LAPTOPS.

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

# PPA for TLPUI
add-apt-repository ppa:linuxuprising/apps 

apt update

# Power management for Thinkpad Laptops
apt -y install tlp tlpui tp-smapi-dkms acpi-call-dkms tlp-rdw


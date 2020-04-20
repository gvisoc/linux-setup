#!/bin/bash

# THIS IS SPECIFIC FOR THINKPAD LAPTOPS.

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

apt update
apt -y install software-properties-common
# PPA for TLPUI
add-apt-repository ppa:linuxuprising/apps 

apt update

# Power management for my specific Thinkpad Laptop
apt -y install tlp tlpui acpi-call-dkms tlp-rdw


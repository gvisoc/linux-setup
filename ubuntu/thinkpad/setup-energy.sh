#!/bin/bash

# THIS IS SPECIFIC FOR THINKPAD LAPTOPS.

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

apt update

# Power management for my specific Thinkpad Laptop
apt -y install tlp acpi-call-dkms tlp-rdw


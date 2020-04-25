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
apt -y install tlp tlpui acpi-call-dkms tlp-rdw powertop

# Refer to https://www.reddit.com/r/thinkpad/wiki/os/linux

echo "====================================( NOTE )===================================="
echo "The screen may blink a number of times now, and powertop will open."
read -p "Exit it pressing 'q' repeatedly [Press Any key]" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Calibrating powertop..."
fi

powertop calibrate

rm -f /etc/systemd/system/powertop.service
echo "[Unit]					" >> /etc/systemd/system/powertop.service
echo "Description=Powertop tunings		" >> /etc/systemd/system/powertop.service
echo "						" >> /etc/systemd/system/powertop.service 
echo "[Service]					" >> /etc/systemd/system/powertop.service
echo "Type=idle					" >> /etc/systemd/system/powertop.service
echo "ExecStart=/usr/sbin/powertop --auto-tune	" >> /etc/systemd/system/powertop.service
echo "						" >> /etc/systemd/system/powertop.service
echo "[Install]					" >> /etc/systemd/system/powertop.service
echo "WantedBy=multi-user.target		" >> /etc/systemd/system/powertop.service

systemctl enable --now powertop
systemctl enable --now tlp.service

# This service does not exist in Ubuntu 20.04 -- there's no problem
systemctl enable --now tlp-sleep.service

echo "====================================( DONE )===================================="
echo "Open TLPUI and set 'MAX_LOST_WORK_SECS_ON_BAT' to 15 under tab 'Disks'"
echo "====================================( DONE )===================================="

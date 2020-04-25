#!/bin/bash
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

apt update
# Following line will fail in 20.04, but the service will install (missing pkg, service present)
apt -y install fstrim
systemctl enable fstrim.timer

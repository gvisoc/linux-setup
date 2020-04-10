#!/bin/bash
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

apt update
# Browser of reference
apt -y install firefox

# Backup utility a la Time Machine with support for NFS Mounts 
# and libraries for setting up a Local Encrypted configuration
apt -y install backintime backintime-gnome nfs-common encfs

# Command line utility to interact with the clipboards
apt -y install xclip xsel
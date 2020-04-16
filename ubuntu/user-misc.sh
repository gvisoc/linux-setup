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
apt -y install backintime-common backintime-gnome nfs-common encfs

# Command line utility to interact with the clipboards
apt -y install xclip xsel
<<<<<<< HEAD

# Notable (https://notable.md) for note-taking using GitHub Markdown
sudo snap install notable --classic
=======
>>>>>>> e269a9f861daf3b54d3caab7b42297522f0ad598

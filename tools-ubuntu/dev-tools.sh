#!/bin/bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

apt update
apt -y autoremove
apt -y upgrade


# Java section (LTS version)
apt -y install git openjdk-11-jdk maven

apt -y install snapd

snap refresh
snap install --classic intellij-idea-community
snap install --classic pycharm-community


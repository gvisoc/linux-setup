#!/bin/bash
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

apt update
apt -y autoremove
apt -y upgrade
apt -y install snapd
snap refresh

# IntelliJ IDEA Community Edition and Visual Studio Code
snap install --classic intellij-idea-community
snap install --classic pycharm-community
snap install --classic code
source ~/.profile

# Java LTS and Maven setup, system-wide
apt -y install git openjdk-11-jdk maven
echo ""
mvn -v 
echo ""
echo "====================================( DONE )===================================="
echo "Use intellij-idea-community as IDE"
echo "Java 11 SDK is in the PATH, as well as maven"
echo "====================================( DONE )===================================="
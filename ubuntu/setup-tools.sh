#!/bin/bash
USER=`id -nu`
ORIG_DIR=`pwd`
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi



mkdir -p ~/.setup-tmp
cd ~/.setup-tmp

apt-get update
apt-get -y autoremove
apt-get -y upgrade

# Snap
apt-get -y install snapd

# Browser of reference
apt-get -y install firefox

# Basic build tools
apt-get -y install git gcc binutils make
apt -y install libcurl4-openssl-dev libsqlite3-dev pkg-config
snap install --classic dmd 
snap install --classic dub

# Java section (LTS version)
apt-get -y install openjdk-11-jdk maven

# Idea & Pycharm
curl https://download.jetbrains.com/idea/ideaIC-2019.3.4.tar.gz.sha256 --output ideaIC-2019.3.4.tar.gz.sha256 --silent
curl https://download.jetbrains.com/python/pycharm-community-2019.3.4.tar.gz.sha256 --output pycharm-community-2019.3.4.tar.gz.sha256 --silent
curl https://download-cf.jetbrains.com/python/pycharm-community-2019.3.4.tar.gz --output pycharm-community-2019.3.4.tar.gz --silent
curl https://download-cf.jetbrains.com/idea/ideaIC-2019.3.4.tar.gz --output ideaIC-2019.3.4.tar.gz --silent

shasum -a 256 -c ideaIC-2019.3.4.tar.gz.sha256
if [ $? != 0 ]; then 
    echo "Intellij IDEA sha 256 check failed"
else 
    mv ideaIC-2019.3.4.tar.gz ~/Downloads/
    chown $USER:$USER ~/Downloads/ideaIC-2019.3.4.tar.gz
fi

shasum -a 256 -c pycharm-community-2019.3.4.tar.gz.sha256
if [ $? != 0 ]; then 
    echo "Intellij PyCharm sha 256 check failed"
else
    mv pycharm-community-2019.3.4.tar.gz ~/Downloads/
    chown $USER:$USER ~/Downloads/pycharm-community-2019.3.4.tar.gz
fi

cd $ORIG_DIR 
rm -rf ~/.setup-tmp

echo "Verified tarballs for IDEA and PyCharm are in ~/Downloads"
echo "Reboot the machine and run ./setup-onedrive.sh" 
echo "Make sure to configure OneDrive Client before using. Check https://1drv.ms/u/s!AvCmrVr47XedkuFCUO-A-I7jubsBPA?e=KsR1ud"

# tar xzf ideaIC-2019.3.4.tar.gz -C /opt
# rm ideaIC-2019*
# sh /opt/ideaIC-2019.3.4/bin/idea

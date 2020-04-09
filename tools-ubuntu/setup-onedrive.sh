#!/bin/bash
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

ORIG_DIR=`pwd`
mkdir -p ~/.setup-tmp
cd ~/.setup-tmp


apt-get update
apt-get -y autoremove
apt-get -y upgrade

# Basic build tools
apt -y install git gcc binutils make xclip

# Snap
apt -y install snapd
apt -y install git libcurl4-openssl-dev libsqlite3-dev pkg-config
snap refresh
snap install --classic dmd 
snap install --classic dub
source ~/.profile

# Onedrive client for Linux
git clone https://github.com/abraunegg/onedrive.git
if [ $? -eq 0 ]; then
    cd onedrive
    ./configure
    make
    sudo make install
    cd ..
    rm -rf onedrive
fi
echo ""
echo "============================================================( DONE )============================================================"
echo "Use Onedrive in the command line by executing \"onedrive\""
echo "Make sure to configure OneDrive Client before using. Check https://1drv.ms/u/s!AvCmrVr47XedkuFCUO-A-I7jubsBPA?e=KsR1ud"
echo "============================================================( DONE )============================================================"
cd $ORIG_DIR
rm -rf ~/.setup-tmp 

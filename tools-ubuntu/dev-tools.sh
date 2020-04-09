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


# Java section (LTS version)
apt-get -y install git openjdk-11-jdk maven

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
    chmod o+w ~/Downloads/ideaIC-2019.3.4.tar.gz
fi

shasum -a 256 -c pycharm-community-2019.3.4.tar.gz.sha256
if [ $? != 0 ]; then 
    echo "Intellij PyCharm sha 256 check failed"
else
    mv pycharm-community-2019.3.4.tar.gz ~/Downloads/
    chown $USER:$USER ~/Downloads/pycharm-community-2019.3.4.tar.gz
    chmod o+w ~/Downloads/pycharm-community-2019.3.4.tar.gz
fi

cd $ORIG_DIR 
rm -rf ~/.setup-tmp

echo "Verified tarballs for IDEA and PyCharm are in ~/Downloads"


# tar xzf ideaIC-2019.3.4.tar.gz -C /opt
# rm ideaIC-2019*
# sh /opt/ideaIC-2019.3.4/bin/idea

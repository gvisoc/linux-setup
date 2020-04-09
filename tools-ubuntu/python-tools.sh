#!/bin/bash
USER=$1
if [ $EUID != 0 ]; then
    USER=`id -un`
    sudo "$0" "$USER"
    exit $?
fi

apt update
apt -y autoremove
apt -y upgrade
apt -y install snapd
snap refresh

# IntelliJ PyCharm Community Edition and Visual Studio Code
snap install --classic pycharm-community
snap install --classic code
source ~/.profile

# Python 3 virtual environments setup, system-wide
apt -y install python3

# elementaryOS, as many Ubuntuses, doesn't come with pip3 by default.
# Install pip for python 3 (whatever the .X it is)
apt -y install python3-pip python3-gpg python3-keyring python3-dbus python3-secretstorage

# If your system is LTS, which should be for production applications 
# (as opposed to innovation oriented, or R+D), your Python will be LTS.
# As of April 2020, LTS is 3.6 (security fixes), and latest stable is 3.8
# 3.6 is the one present in elementary OS, which forks Ubuntu LTS.

# Update pip with pip, in the user space. It might be newer than apt's
sudo -u $USER python3 -m pip install --user --upgrade pip

# We are going to use venv, which is included for Python 3.3+. End of the script.
echo ""
echo "====================================( DONE )===================================="
echo "Use pycharm-community as IDE"
echo "Use venv to create virtual environments outside of the IDE." 
echo "    Check https://docs.python.org/3/library/venv.html?highlight=venv#module-venv"
echo "====================================( DONE )===================================="

#!/bin/bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

# Old indicators panel for elementary
# For Telegram, Dropbox, Bitwarden,... tray icons
ORIG_DIR=`pwd`
mkdir -p ~/.setup-tmp
cd ~/.setup-tmp
curl --remote-name http://ppa.launchpad.net/elementary-os/stable/ubuntu/pool/main/w/wingpanel-indicator-ayatana/wingpanel-indicator-ayatana_2.0.3+r27+pkg17~ubuntu0.4.1.1_amd64.deb
dpkg -i wingpanel-indicator-ayatana_2.0.3+r27+pkg17\~ubuntu0.4.1.1_amd64.deb
if [ $? -eq 0 ]; then
    # remove duplicated network indicator from old panel
    sudo mv /etc/xdg/autostart/nm-applet.desktop /etc/xdg/autostart/nm-applet.desktop.old
fi
cd $ORIG_DIR
rm -rf ~/.setup-tmp 
#/bin/bash
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
echo "Use Onedrive in the command line by executing \"onedrive\""
echo "Make sure to configure OneDrive Client before using. Check https://1drv.ms/u/s!AvCmrVr47XedkuFCUO-A-I7jubsBPA?e=KsR1ud"

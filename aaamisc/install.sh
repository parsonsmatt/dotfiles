#!/bin/sh

# Install Google Chrome PPA
if [ ! hash google-chrome ]; then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
fi

# Install VirtualBox PPA
if [ ! hash virtualbox ]; then
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    sudo echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list.d/vbox.list
fi

sudo apt-get update

sudo apt-get install nfs-common redshift zsh silversearcher-ag wallch google-chrome-stable virtualbox-4.3 dkms -y

# install oh-my-zsh
if [ ! -f ~/.oh-my-zsh ]; then
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

# remap caps lock to control
sudo sed -i "s/XKBOPTIONS=\"\"/XKBOPTIONS=\"ctrl:nocaps\"/g" /etc/default/keyboard 

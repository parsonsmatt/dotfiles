#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install xclip inotify-tools editorconfig nfs-common redshift zsh silversearcher-ag wallch dkms exuberant-ctags autojump -y

# install oh-my-zsh
if [ ! -f ~/.oh-my-zsh ]; then
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

# remap caps lock to control
sudo sed -i "s/XKBOPTIONS=\"\"/XKBOPTIONS=\"ctrl:nocaps\"/g" /etc/default/keyboard

# install stack
curl -sSL https://get.haskellstack.org/ | sh

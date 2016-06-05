#!/bin/sh

sudo apt-get install software-properties-common -y

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update

sudo apt-get install neovim python-dev python-pip python3-dev python3-pip xsel -y

mkdir -p ~/.config
# ln -s ~/.nvim ~/.config/nvim

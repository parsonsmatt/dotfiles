#!/usr/bin/env zsh

sudo apt-get install hledger hledger-web -y

echo "Linking ~/.hledger.journal to ~/Dropbox/.hledger.journal"
ln -s ~/Dropbox/.hledger.journal ~/.hledger.journal 

#! /bin/bash

sudo apt-get install curl -y

# Install rvm with bundler
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby=ruby-2.2.1 --with-gems="bundler"
source ~/.rvm/scripts/rvm



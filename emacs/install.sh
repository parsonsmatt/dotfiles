#!/bin/bash

sudo apt-get install emacs -y

if [ ! -d "~/.emacs.d"]; then
        git clone --recursive http://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

#!/bin/bash

# Script to install xmonad and all dependencies.

sudo apt-get install -y xmonad libghc-xmonad-contrib-dev libghc-xmonad-dev suckless-tools xscreensaver stalonetray libiw-dev libasound2-dev c2hs libxpm-dev xbacklight feh libxml2-dev xcompmgr moreutils

cabal install xmonad-extras
cabal install alsa-core -f-pkgConfig
cabal install xmobar -fall_extensions

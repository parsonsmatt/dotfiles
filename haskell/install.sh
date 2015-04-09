#!/bin/sh

sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install cabal-install-1.20 ghc-7.8.3 happy-1.19.4 alex-3.1.3 -y

cabal update
cabal install ghc-mod

#!/bin/sh

sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:hvr/ghc

# Stack :D
wget -q -O- http://download.fpcomplete.com/ubuntu/fpco.key | sudo apt-key add -
echo 'deb http://download.fpcomplete.com/ubuntu/vivid stable main' | sudo tee /etc/apt/sources.list.d/fpco.list
sudo apt-get update
sudo apt-get install stack cabal-install-1.22 ghc-7.10.2 happy-1.19.5 alex-3.1.4 -y
reload!

cabal update
cabal install haddock ghcid hoogle pointfree hdevtools hlint purescript

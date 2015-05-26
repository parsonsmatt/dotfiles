#!/bin/sh

sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install cabal-install-1.22 ghc-7.10.2 happy-1.19.5 alex-3.1.5 -y

cabal update
cabal install haddock
cabal install ghc-mod
cabal install hoogle
cabal install pointfree
cabal install hdevtools
cabal install hlint
cabal install purescript

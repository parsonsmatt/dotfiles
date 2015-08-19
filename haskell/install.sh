#!/usr/bin/env zsh

sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:hvr/ghc
sudo add-apt

sudo apt-get install cabal-install-1.22 ghc-7.10.2 happy-1.19.5 alex-3.1.4 -y
# reload!

# cabal update
# cabal install haddock ghcid hoogle pointfree hlint purescript stylish-haskell

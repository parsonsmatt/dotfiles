#!/usr/bin/env zsh

mkdir -p ~/.local/bin

curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein >> ~/.local/bin/lein

chmod a+x ~/.local/bin/lein

~/.local/bin/lein

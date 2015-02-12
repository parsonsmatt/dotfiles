#! /bin/sh

sudo apt-get install -y pandoc texlive xzdec pandoc-citeproc
tlmgr init-usertree
tlmgr install collection-fontsrecommended

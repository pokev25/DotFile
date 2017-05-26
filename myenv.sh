#!/bin/bash

# tmux
cp .tmux.conf ~/
if [$1 = 'root']; then
  cp tmx /usr/local/bin
  chmod +x /usr/local/bin/tmx
fi

# vim : from vimbootstrap
curl 'http://vim-bootstrap.com/generate.vim' --data 'langs=javascript&langs=php&langs=html&langs=ruby&langs=python&langs=perl&editor=vim' > ~/.vimrc
cp .vimrc.local ~/
cp .vimrc.local.bundles ~/

vim +PlugInstall +qall

# fzf setup
~/.fzf/install

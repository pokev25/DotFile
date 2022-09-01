#!/bin/sh

USER_BIN=/usr/local/bin

CHECK=$(command -v vim)

if [ "$CHECK" = "" ]; then
  echo "check vim install"
  exit
fi

# tmux
if [ ! -f ~/.tmux.conf ]; then
  cp .tmux.conf ~/
fi

if [ $EUID == 0 ]; then
  if [ ! -f $USER_BIN/tmx ]; then
    cp tmx $USER_BIN
    chmod +x $USER_BIN/tmx
  fi
fi

# vim : from vimbootstrap
if [ ! -f ~/.vimrc ]; then
  curl 'https://vim-bootstrap.com/generate.vim' --data 'langs=javascript&langs=php&langs=html&langs=python&langs=perl&editor=vim' > ~/.vimrc
  cp .vimrc.local ~/
  cp .vimrc.local.bundles ~/
fi

vim +PlugInstall +qall

# fzf setup
~/.fzf/install

#!/bin/bash

# tmux 설정
cp .tmux.conf ~/
chmod +x tmx
cp tmx /usr/local/bin

# vim 설정
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/
vim +PluginInstall +qall
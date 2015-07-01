#!/bin/bash

cp .tmux.conf ~/
cp .vimrc ~/
chmod +x tmx
cp tmx /usr/local/bin

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
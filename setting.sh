#!/bin/bash

# tmux 설정
cp .tmux.conf ~/
chmod +x tmx
cp tmx /usr/local/bin

# vim 설정
#git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#cp .vimrc ~/
#vim +PluginInstall +qall

# spf13용 vim 설치
curl http://j.mp/spf13-vim3 -L -o - | sh

cp .vimrc.local ~/
cp .vimrc.before.local ~/

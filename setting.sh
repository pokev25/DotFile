#!/bin/bash

# tmux 설정
cp .tmux.conf ~/
cp tmx /usr/local/bin
chmod +x /usr/local/bin/tmx

# vim 설정
#git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#cp .vimrc ~/
#vim +PluginInstall +qall

# spf13용 vim 설치
curl http://j.mp/spf13-vim3 -L -o - | sh

cp .vimrc.local ~/
cp .vimrc.before.local ~/

#fzf 설치
yum -y install tar
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

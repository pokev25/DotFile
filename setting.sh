#!/bin/bash

# tmux 설정
cp .tmux.conf ~/
chmod +x tmx
cp tmx /usr/local/bin

# vim 설정
cp .vimrc.local ~/
cp .vimrc.before.local ~/
vim +PluginInstall +qall

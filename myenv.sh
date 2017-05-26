#!/bin/bash

# tmux
cp .tmux.conf ~/

# vim
cp .vimrc ~/
cp .vimrc.local ~/
cp .vimrc.local.bundles ~/

vim +PlugInstall +qall

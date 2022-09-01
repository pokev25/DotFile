#!/bin/bash

CHECK=$(command -v vim)
#zsh
if [ $EUID == 0 ]; then
  if [ "$CHECK" = "" ]; then
    yum -y install zsh
  fi
fi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

cp .zshrc ~/
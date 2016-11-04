oh-my-zsh 설치 후 설정
======================

-	zsh config`
	vim .zshrc
	`

```
# Theme 를 둘 중 하나 설정 한다.
ZSH_THEME="ys"
ZSH_THEME="agnoster"

# add 256 coler support
TERM=xterm-256color

# spf13-vim3 에서 특수 문자 깨지는것 방지
export LANG=en_US.UTF-8

# plug 설정
git tmux docker docker-compose yum zsh_relaod

```

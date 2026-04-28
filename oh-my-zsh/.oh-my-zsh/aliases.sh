#!/usr/bin/bash

alias xcopy="xclip"
alias xpaste="xclip -o"

alias sc="flameshot gui"

alias ccd="pwd | xclip"

# Programs
alias vidconvert="ffmpeg -i"

# Git stuff
alias gc="git add -A && git commit -m"

# Very nice things
cd_gitroot() {
  cd "$(git rev-parse --show-toplevel)" 
}

alias cr="cd_gitroot"

alias dev="cd $HOME/Projects/zetta/"

alias dc="docker-compose"

alias dots="cd $HOME/.dotfiles/"

# Vim stuff 
alias vi="nvim"
alias vim="nvim"

# ssh
alias s="ssh"

# python
alias python="python3"
alias py="python"

# fmt
alias fmt="cd build && ninja format-all && cd -"

#!/usr/bin/bash

alias xcopy="xclip -selection c"
alias xpaste="xclip -selection c -o"

alias ccd="pwd | xclip"

# Programs
alias vidconvert="ffmpeg -i"
# alias vim="nvim"
# alias vi="nvim"

# Shortcuts
alias todo="task"

# Laptop stuff
alias setbri="xrandr --output eDP-1 --brightness"

# Cringe
alias gdb-multiarch="arm-none-eabi-gdb"

# Git stuff
alias gc="git add -A && git commit -m"

# Very nice things
cd_gitroot() {
  cd "$(git rev-parse --show-toplevel)" 
}

alias cr="cd_gitroot"

alias dev="cd $HOME/Projects/almtech/exa/code/"

alias dc="docker-compose"

alias dots="cd $HOME/.dotfiles/"

# Vim stuff 
# alias vi="nvim"
# alias vim="nvim"

# Clock reset thing 
alias restart_clock="ssh rasp \"sudo systemctl restart pyscript@clock.py.service\""

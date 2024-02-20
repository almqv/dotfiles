#!/usr/bin/bash

alias xcopy="xclip -selection c"
alias xpaste="xclip -selection c -o"

alias ccd="pwd | xclip"

# Programs
alias vidconvert="ffmpeg -i"
# alias vim="nvim"
# alias vi="nvim"

# Shortcuts
# alias todo="task"
alias armas="arm-none-eabi-as -march=armv6-m -g"
alias armld="arm-none-eabi-ld -T \"/usr/share/eterm8/md407-ram.x\""
alias armgdb="arm-none-eabi-gdb"

# Laptop stuff
alias setbri="xrandr --output eDP-1 --brightness"
alias lsbat="cat /sys/class/power_supply/BAT0/capacity"
alias lsnet="nmcli | grep "^wlp" | sed 's/\ connected\ to\ //g' | cut -d ':' -f2"
alias gdb-multiarch="arm-none-eabi-gdb"

# Git stuff
alias gc="git add -A && git commit -m"

# Shortcuts 
alias dots="cd $HOME/.dotfiles"

# Very nice things
cd_gitroot() {
  cd "$(git rev-parse --show-toplevel)" 
}

alias cr="cd_gitroot"

alias dev="cd $HOME/Projects/almtech/ingenuity/"

alias dc="docker-compose"

alias dots="cd $HOME/.dotfiles/"

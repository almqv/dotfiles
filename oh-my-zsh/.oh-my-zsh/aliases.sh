#!/usr/bin/bash

alias xcopy="xclip -selection c"
alias xpaste="xclip -selection c -o"

alias ccd="pwd | xclip"

# Programs
alias vidconvert="ffmpeg -i"
alias vim="nvim"
alias vi="nvim"
# alias idea="export _JAVA_AWT_WM_NONREPARENTING=1 idea"

# Shortcuts
alias todo="task"

# Laptop stuff
alias setbri="xrandr --output eDP-1 --brightness"
alias lsbat="echo \"Power: $(cat /sys/class/power_supply/BAT0/capacity)\"%"
alias lsnet="nmcli | grep "^wlp" | sed 's/\ connected\ to\ //g' | cut -d ':' -f2"

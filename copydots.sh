#!/bin/bash

repoPath=$HOME/dotfiles

# All those things
cp -r $HOME/.config/i3 $repoPath
cp -r $HOME/.config/rofi $repoPath
cp -r $HOME/.config/conky $repoPath
cp -r $HOME/.config/polybar $repoPath
cp -r $HOME/.config/termite $repoPath
cp -r $HOME/.config/neofetch $repoPath

# Vim
cp $HOME/.vimrc $repoPath/vimrc

# Background
cp $HOME/.wallpaper.jpg $repoPath/wallpaper.jpg


#!/bin/bash

repoPath=$HOME/Projects/linux/dotfiles

# All those things
cp -r $HOME/.config/rofi $repoPath
cp -r $HOME/.config/conky $repoPath
cp -r $HOME/.config/polybar $repoPath
cp -r $HOME/.config/neofetch $repoPath
cp -r $HOME/.config/ranger $repoPath
cp -r $HOME/.config/dunst $repoPath
cp -r $HOME/.config/picom $repoPath

# X
cp $HOME/.Xresources $repoPath/.Xresources

# Doom Emacs
rm -r $repoPath/doom.d
cp -r $HOME/.doom.d $repoPath/doom.d

# Vim
cp $HOME/.vimrc $repoPath/vimrc

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
cp -r $HOME/.config/nvim $repoPath

# Wallpaper
rm $repoPath/wallpaper.jpg; cp $HOME/.wallpaper.jpg $repoPath/wallpaper.jpg

# ZSH
rm -r $repoPath/zsh-themes; cp -r $HOME/.oh-my-zsh/custom/themes $repoPath/zsh-themes
cp $HOME/.zshrc $repoPath

# X
cp $HOME/.Xresources $repoPath/.Xresources

# Vim
cp $HOME/.vimrc $repoPath/vimrc

# ST-luke
cp $HOME/Projects/linux/st-luke/config.h $repoPath/luke-st_config.h

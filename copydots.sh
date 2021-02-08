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

# Wallpaper
rm $repoPath/wallpaper.jpg; cp $HOME/.wallpaper.jpg $repoPath/wallpaper.jpg

# ZSH
rm -r $repoPath/zsh-themes; cp -r $HOME/.oh-my-zsh/custom/themes $repoPath/zsh-themes
cp $HOME/.zshrc $repoPath

# X
cp $HOME/.Xresources $repoPath/.Xresources

# Doom Emacs
rm -r $repoPath/doom.d
cp -r $HOME/.doom.d $repoPath/doom.d

# Vim
cp $HOME/.vimrc $repoPath/vimrc

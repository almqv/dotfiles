#!/bin/bash

repoPath=$HOME/Projects/linux/dotfiles
cfgPath=$repoPath/.config

# All those things
cp -r $HOME/.config/polybar $cfgPath
cp -r $HOME/.config/neofetch $cfgPath
cp -r $HOME/.config/dunst $cfgPath
cp -r $HOME/.config/picom $cfgPath
cp -r $HOME/.config/nvim $cfgPath
rm -rf $cfgPath/nvim/plugged
cp -r $HOME/.config/alacritty $cfgPath

# ZSH
rm -r $repoPath/zsh-themes; cp -r $HOME/.oh-my-zsh/custom/themes $repoPath/zsh-themes
cp $HOME/.zshrc $repoPath

# Vim
cp $HOME/.vimrc $repoPath/vimrc


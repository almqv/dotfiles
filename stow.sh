#!/usr/bin/bash

stowoption=$1

stow $stowoption .vimrc -t $HOME
stow $stowoption .zshrc -t $HOME
stow $stowoption .config -t $HOME/.config

#!/bin/bash

# Initial symlinking, creating dotfiles directory on a machine

# Variables
dir=~/dotfiles
files="vimrc vim zshrc bashrc gitconfig oh-my-zsh"

for file in $files; do
  mv ~/.$file $dir
  ln -s $dir/.$file ~/.$file
done


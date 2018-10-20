#!/bin/bash

# On a new machine, setting up dotfiles from GitHub

# Variables
dir=~/dotfiles
olddir=~/dotfiles_old
files="vimrc vim zshrc bashrc gitconfig oh-my-zsh"

# Make directories
mkdir -p $dir
mkdir -p $olddir

# Clone from git
cd $dir
git clone https://github.com/colbymorrison/dotfiles

# Get rid of old files and symlink
for file in files; do
  mv ~/.$file $olddir
  ln -s $dir/.$file ~/.$file
done

echo "Done! Check the ~/dotfiles_old directory for previous dotfiles"

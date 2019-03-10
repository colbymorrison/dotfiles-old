#!/bin/bash

# Set up dotfiles on a new machine

# Variables
dir=~/dotfiles
olddir=~/dotfiles_old
files=".vimrc .vim .zshrc .bashrc .gitconfig .oh-my-zsh" # The dotfiles in question

# Make directories
#echo "Making old directory...\n"
cd $dir

# Install ohmyzsh
#echo "Installing oh-my-zsh...\n"
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install VimPlugins
echo "Installing vim plugins...\n"
#vim +PluginInstall

# Move templates
mv templates/* .vim/bundle/vim-latex/ftplugin/latex-suite/templates

# Get rid of old files and symlink
echo "Symlinking dotflines...\n"
for file in $files; do
  if [  -f $dir/$file ]; then
    mv ~/$file $olddir
  else
   touch $dir/$file 
  fi
  ln -s $dir/$file ~/$file
done

echo "Done! Check the ~/dotfiles_old directory for previous dotfiles"

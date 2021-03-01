#! /bin/bash

echo "Removing ~/$1"
rm ~/$1

echo "Copying ~/dotfiles/$1 to ~"
cp -r ~/dotfiles/$1 ~

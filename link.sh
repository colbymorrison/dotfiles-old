#!/bin/bash

for file in ~/dotfiles/*; do
   [ -d "$file" ] && stow ${file##*/} 
done 
  

    

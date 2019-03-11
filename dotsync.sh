#! /bin/bash
inside="git shell vim X11"

for dir in $inside
do
    for file in ~/dotfiles/$dir/.[^.]*
     do
        [[ -d $file ]] && continue
        
        # Get the file path in ~
        filebase=${file##*/}
    
        # If the file doesn't exist in ~, create and link 
        if [ ! -f ~/$filebase ]; then
            echo "$homepath does not exist, linking"
            ln -s ~/$filebase $file
        else
            echo "~/$filebase exists and is linked"
        fi
    done
done

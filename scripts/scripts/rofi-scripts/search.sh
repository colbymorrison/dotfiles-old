#! /bin/bash

cd ~

file=$(fd | rofi -dmenu -p "Search ")
type=$(xdg-mime query filetype $file)
echo $type

if [[ $type == 'text/plain' ]]; then
    st -e vim $file
else
    xdg-open $file
fi

#! /bin/bash

cd ~/dotfiles

add(){
    git submodule add $2 vim/.vim/pack/plugin/start/
}

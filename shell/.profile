#! /bin/bash
export TERMINAL=st
export PATH=$PATH:~/scripts:/home/colby/.gem/ruby/2.7.0/bin 
export GOPATH=$(go env GOPATH)
export GOROOT=$(go env GOROOT)
export VISUAL=vim
export EDITOR=$VISUAL
export CLICOLOR=1
export QT_STYLE_OVERRIDE=adwaita
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export FZF_DEFAULT_COMMAND='fd -H --type f'

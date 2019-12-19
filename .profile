#! /bin/bash
export PATH="$PATH:/home/colby/scripts"
export TERMINAL=termite
export GOPATH=$(go env GOPATH)
export GOROOT=$(go env GOROOT)
export VISUAL=vim
export EDITOR=$visual
source ~/scripts/monitor.sh
compton &

#! /bin/bash
export PATH="$PATH:/home/colby/scripts"
export TERMINAL=termite
export GOPATH=$(go env GOPATH)
export GOROOT=$(go env GOROOT)
source ~/scripts/monitor.sh
compton &

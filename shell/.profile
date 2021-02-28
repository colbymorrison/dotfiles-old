#!/bin/bash

export CLICOLOR=1
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd -H -t f -t d'
export FZF_DEFAULT_OPTS='--preview="~/scripts/preview.sh {}"'
export DEFAULT_TMUX_SESSION='fbc'
export DEFAULT_TMUX_DIR='~/fbc'
export IS_FB=$(echo $HOSTNAME | grep facebook.com > /dev/null; echo $?)
export PATH="$HOME/bin:$PATH"
export CPY_PRG="nc localhost 8377"
export VISUAL=$EDITOR

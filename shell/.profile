#!/bin/bash

export PATH="$HOME/bin:$PATH"
export EDITOR=nvim
export VISUAL=$EDITOR
export CLICOLOR=1
export FZF_DEFAULT_COMMAND='fd -H -t f -t d'
export FZF_DEFAULT_OPTS='--preview="~/scripts/preview.sh {}"'

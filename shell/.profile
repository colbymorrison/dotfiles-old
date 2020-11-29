#! /bin/bash
export GNUBINS="$(find /usr/local/opt -type d -follow -name gnubin -print)";

for bindir in ${GNUBINS[@]}; do
  export PATH=$bindir:$PATH;
done;

export PATH="~/bin:$PATH"
export TERMINAL=iTerm
export VISUAL=vim
export EDITOR=$VISUAL
export CLICOLOR=1
export FZF_DEFAULT_COMMAND='fd -t f -t d -H'
export FZF_DEFAULT_OPTS='--preview="~/scripts/preview.sh" --bind="space:toggle-preview"'
export BASH_SILENCE_DEPRECATION_WARNING=1
export COPY="pbcopy"
export PASTE="pbpaste"


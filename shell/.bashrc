#
# ~/.bashrc
# Run by interactive shells (after /etc/bash.bashrc)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ---Env vars--- #
export PS1="\[\033[0;31m\]\u@\h\[\033[01;34m\] \W \[\033[32m\]\$(~/scripts/parse_git_branch)\[\033[00m\]$ "
export TERM=xterm-256color
export VISUAL=vim
export EDITOR=$VISUAL
export CLICOLOR=1

# ---Alias--- #
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ---Functions--- #

# Edit config files
function ec(){
  cfg_path=".config/$1/config"
  [[ -f $cfg_path ]] && vim $cfg_path; return
  echo  "No directory in ~/.config with name $1"
}

# ---Bind--- #
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
set -o vi


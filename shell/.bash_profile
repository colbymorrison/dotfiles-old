# .bash_profile
# bash_profile is for setting environment variables and anything else that
# should happen at login.  bash_profile is sourced only in login shells (e.g.,
# the shell started when you log in via SSH).  The main things that make sense
# to put in bash_profile are environment variable exports and startup programs.
# See https://fburl.com/bash for more information.

# Source bashrc to pull in configuration for interactive shell use (the bashrc
# will just return if the shell is not interactive).
if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi

# Export environment variables, start background programs, etc.
export EDITOR=nvim
export VISUAL=$EDITOR
export CLICOLOR=1
export PATH=$PATH:$HOME/bin
if [[ ! "$PATH" == */home/cmorrison/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/cmorrison/.fzf/bin"
  export FZF_DEFAULT_COMMAND='fd -H --type f'
fi
export MYPY_CACHE_DIR=~/.cache/mypy

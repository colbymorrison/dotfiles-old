# .bashrc
# bashrc is for aliases, functions, and shell configuration intended for use in
# interactive shells.  However, in some circumstances, bash sources bashrc even
# in non-interactive shells (e.g., when using scp), so it is standard practice
# to check for interactivity at the top of .bashrc and return immediately if
# the shell is not interactive.  The following line does that; don't remove it!
[[ $- != *i* ]] && return

# Load CentOS stuff and Facebook stuff (don't remove these lines).
source /etc/bashrc
source /usr/facebook/ops/rc/master.bashrc

# ---Env vars--- #
export PS1="\[\033[0;93m\]\u@\h\[\033[01;34m\] \W \[\033[32m\]\$(~/scripts/parse_git_branch)\[\033[00m\]$ "
export PATH="$HOME/bin:$PATH"

# ---Alias--- #
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# ---Forward Proxy Everywhere--#
#export HTTP_PROXY="http://fwdproxy:8080"
#export HTTPS_PROXY="http://fwdproxy:8080"

# --History--#
HISTFILESIZE=-1
HISTSIZE=1000000
HISTCONTROL=ignoredups
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND" # share history between open terminals

# ---Functions--- #
open_if_exists(){
  if [[ -e $1  ]]; then
    [[ -f $1 ]] && $EDITOR $1 || cd $1
  fi
}

mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Run prev command w/ different options
difo(){
  last_command=$(history | tail -2 | head -1 | sed s/[0-9]//g)
  $last_command $1
}

# Fzf all files and directories in current directory
opf() {
  open_if_exists $(fzf)
}

# Fzf system files, use myc to fuzzy search repo files
ops(){
  open_if_exists $(fd . -t f -t d -H -E 'fbsource' '/home/cmorrison' | fzf -m --preview="less {}")
}

# Fzf fbcode directories
cdf() {
  cd "$(fd  . -t d '/home/cmorrison/fbcode' | fzf)"
}

tmux_connect(){
  if [[ ! $TMUX && -t 0 && $TERM_PROGRAM != vscode ]]; then
    fbc=$(tmux list-sessions -F '#{session_name}' 2>/dev/null | grep fbc | head -1)
    if [[ $fbc ]]; then
      tmux $TMUX_OPTIONS attach-session -t fbc
    else
      cd ~/fbcode
      tmux $TMUX_OPTIONS new-session -s fbc
    fi
  fi
}

checkout_fzf() {
  [ "$#" -eq 1 ] && git checkout $1 || git checkout $(git branch | fzf --height="10")
}

# Pastry with command name as title
p() {
  "$@" | pastry -t "$*"
}

# Jump to corresponding buck-out directory
buckout() {
  local repopath="$(buck root)"
  pushd "$repopath/buck-out/gen/$(realpath . --relative-to="$repopath")"
}

# --Completion-- #
[[ -f /usr/share/bash-completion/bash_completion ]] && \
  . /usr/share/bash-completion/bash_completion

[[ -f $HOME/.fzf/ ]] && \
  . $HOME/.fzf/shell/completion.bash ; \
  . $HOME/.fzf/shell/key-bindings.bash

# --Auto Connect tmux-- #
tmux_connect


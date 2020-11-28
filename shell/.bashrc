# .bashrc

# Run by interactive shells (after /etc/bash.bashrc)

# only source in interactive shell
[[ $- != *i* ]] && return
# ---Env vars--- #
export PS1="\[\033[0;93m\]\u@\h\[\033[01;34m\] \W \[\033[32m\]\$(~/scripts/parse_git_branch)\[\033[00m\]$ "

# ---Alias--- #
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

## Mac specific aliases ##
# Homebrew #
alias brewin='brew install'
alias brewup='brew upgrade'
alias brewrm='brew remove'

# iTerm 2 Shell Integration#
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# ---Functions--- #

mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Run prev command w/ different options
difo(){
  last_command=$(history | tail -2 | head -1 | sed s/[0-9]//g)
  $last_command $1
}

open_if_exists(){
  if [[ -e $1  ]]; then
    [[ -f $1 ]] && $EDITOR $1 || cd $1
  fi
}

# Fzf all files and directories in current directory
opf() {
  open_if_exists $(fzf)
}

# Fzf system files, use myc to fuzzy search repo files
ops(){
  open_if_exists $(fd . -t f -t d -H -E 'fbsource' "$HOME" | fzf -m --preview="less {}")
}

# Fzf all directories under ~
cdf() {
    cd "$(fd . -t d  -H "$HOME" | fzf)"
}

# Autoconnect to tmux
tmux_connect(){
  DEFAULT_TMUX_SESSION=fbc
  if [[ ! $TMUX && -t 0 && $TERM_PROGRAM != vscode ]]; then
    session_exists=$(tmux list-sessions -F '#{session_name}' 2>/dev/null | grep $DEFAULT_TMUX_SESSION  | head -1)
    if [[ $session_exists ]]; then
      tmux $TMUX_OPTIONS attach-session -t $DEFAULT_TMUX_SESSION
    else
      cd ~/fbcode
      tmux $TMUX_OPTIONS new-session -s $DEFAULT_TMUX_SESSION
    fi
  fi
}

checkout_fzf() {
    [ "$#" -eq 1 ] && git checkout $1 || git checkout $(git branch | fzf --height="10")
}

# Pastry previous command with command name as title
p() {
  "$@" | pastry -t "$*"
}

## VPN ##
export VPN_HOST='Americas West'

alias vd='/opt/cisco/anyconnect/bin/vpn disconnect'
alias vs='/opt/cisco/anyconnect/bin/vpn state'
alias vw='watch /opt/cisco/anyconnect/bin/vpn state'

vpn() { printf "$1" | /opt/cisco/anyconnect/bin/vpn -s connect "$VPN_HOST"; }

# --Completion-- #
[[ -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

[[ -f ~/dotfiles/shell/git-completion.bash ]] && \
    . ~/dotfiles/shell/git-completion.bash

# Keep autocompletion on git aliases
__git_complete gco _git_checkout


[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

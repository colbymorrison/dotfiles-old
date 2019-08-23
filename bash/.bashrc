# ~/.bashrc
# Run by interactive shells (after /etc/bash.bashrc)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias
alias ls='ls -A'
PS1='[\u@\h \W]\$ '
# Environment variables
export CLICOLOR=1
export VISUAL=vim
export EDITOR=$VISUAL

# Custom functions

# Commits git changed files
function gitch(){
    git add -u
    read "?Commit message: " msg
    echo
    git commit -m $msg
    echo
    git push -u origin $(git branch | grep \* | sed 's/* //')
}

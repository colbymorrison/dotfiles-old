#
# ~/.bashrc
# Run by interactive shells (after /etc/bash.bashrc)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias
alias ls='ls -A --color=auto'
PS1='[\u@\h \W]\$ '

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

function ec(){
  cfg_path=".config/$1/config"
  [[ -f $cfg_path ]] && vim $cfg_path; return
  echo  "No directory in ~/.config with name $1"
}



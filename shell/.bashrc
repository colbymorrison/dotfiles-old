# ~/.bashrc

# Run by interactive shells (after /etc/bash.bashrc)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ---Prompt--- #
export PS1="\[\033[0;31m\]\u@\h\[\033[01;34m\] \W \[\033[32m\]\$(~/scripts/parse_git_branch)\[\033[00m\]$ "

# ---Alias--- #
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## Arch specific aliases ##
# Homebrew #
alias brewin='brew install'
alias brewup='brew upgrade'
alias brewrm='brew remove'

# ---Functions--- #

# Edit config files
ec(){
    cfg_path="/home/colby/.config/$1/config"
    [[ -f $cfg_path ]] && vim $cfg_path; return
    echo  "No directory in ~/.config with name $1"
}

# Run prev command w/ different options
difo(){
    last_command=$(history | tail -2 | head -1 | sed s/[0-9]//g)
    $last_command $1
}

theme(){
    theme=$(wal --theme | fzf | cut -d ' ' -f 3)
    theme_basename=$(echo $theme | sed s/base16-//)
    echo $theme_basename > ~/.colorscheme
    wal --theme $theme
}


# --Completion-- #
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

[[ -f ~/dotfiles/shell/git-completion.bash ]] && \
    . ~/dotfiles/shell/git-completion.bash

# Keep autocompletion on git aliases
__git_complete gco _git_checkout

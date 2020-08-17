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
# ~/.config files #
alias ebsp="$EDITOR ~/.config/bspwm/bspwmrc"
alias esxh="$EDITOR ~/.config/sxhkd/sxhkdrc"
alias epb="$EDITOR '+set syntax=dosini' ~/.config/polybar/config"
alias exr="$EDITOR ~/.Xresources"

# Pacman #
alias pmin='yay -S'
alias pmup='yay -Syu'
alias pmrm='sudo pacman -Rns'
alias spm='sudo pacman'

# Zathura #
alias zth='zathura'
alias ztf='zathura --fork'

# Custom #
alias polyrs='~/.config/polybar/launch.sh'


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
[[ -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

[[ -f ~/dotfiles/shell/git-completion.bash ]] && \
    . ~/dotfiles/shell/git-completion.bash

[[ -f /usr/share/fzf/completion.bash ]]  &&  [[ -f /usr/share/fzf/key-bindings.bash ]] && \
    . /usr/share/fzf/completion.bash 
    . /usr/share/fzf/key-bindings.bash

# Keep autocompletion on git aliases
__git_complete gco _git_checkout

# --pywal-- #
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors.sh # Sets fzf theme and allows use of $color[n] vars in scripts

# ~/.bashrc

# Run by interactive shells (after /etc/bash.bashrc)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ---Prompt--- #
parse_git_branch() {
    branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')

    if [[ ! -z $branch ]]; then
        echo "$branch "
    fi
}
export PS1="\[\033[0;31m\]\u@\h\[\033[01;34m\] \W \[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "

# ---Alias--- #
## ~/.config files ##
alias not="$EDITOR ~/Notes/notes.md"
alias ebsp="$EDITOR ~/.config/bspwm/bspwmrc"
alias esxh="$EDITOR ~/.config/sxhkd/sxhkdrc"
alias epb="$EDITOR '+set syntax=dosini' ~/.config/polybar/config"
alias exr="$EDITOR ~/.Xresources"
alias evi="$EDITOR ~/.vimrc"
alias ebh="$EDITOR ~/.bashrc"

## Directories ## 
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

## Common Commands ## 
alias c='clear'
alias e='exit'
alias g='grep'
alias l='ls -lah'
alias m='man'
alias r='ranger'
alias v='vim'
alias ls='ls -A --color=auto'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias cdf='cd_fzf'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,node_modules}'
alias pag='ps aux | grep'
alias open='xdg-open'
alias ka='killall'
alias sbr='. ~/.bashrc'

## Tmux ##
alias tmat='tmux a -t'
alias tmls='tmux ls'

## Pacman ##
alias pmin='yay -S'
alias pmup='yay -Syu'
alias pmrm='sudo pacman -Rns'
alias spm='sudo pacman'

## Systemctl ##
alias stl='systemctl'
alias spd='betterlockscreen -s dim'
alias jnl='journalctl'

## Zathura ##
alias zth='zathura'
alias ztf='zathura --fork'

## Network Manager ##
alias wils='nmcli d wifi list'
alias wicon='nmcli d wifi connect'

## Git ##
alias ga='git add'
alias gau='git add -u'
alias gb='git branch'
alias gbD='git branch -D'
alias gc='git commit -v'
alias gcam='git commit -a -m'
alias gcamd='git commit --amend'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco=checkout_fzf
alias gd='git diff'
alias gf='git fetch'
alias ggsup='git branch --set-upstream-to=origin/$(parse_git_branch)'
alias gl='git pull'
alias glg='git log --stat'
alias gm='git merge'
alias gp='git push'
alias gst='git status'
alias ggrep='git grep'

## Custom ##
alias polyrs='~/.config/polybar/launch.sh'
alias qemuvm='qemu-system-x86_64 -enable-kvm -vga std -m 2048 -cpu host -smp 4 -net nic,model=virtio -net user,hostfwd=tcp::2222-:22'


# ---Functions--- #

# Edit config files
ec(){
    cfg_path="/home/colby/.config/$1/config"
    [[ -f $cfg_path ]] && vim $cfg_path; return
    echo  "No directory in ~/.config with name $1"
}

# Fzf magic, stolen from https://www.youtube.com/watch?v=QeJkAs_PEQQ
cd_fzf() {
    cd "$(fd . -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && echo "$PWD$"
}

checkout_fzf() {
    [ "$#" -eq 1 ] && git checkout $1 || git checkout $(git branch | fzf --height="10")
}

# --Completion-- #
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

[[ -f ~/dotfiles/shell/git-completion.bash ]] && \
    . ~/dotfiles/shell/git-completion.bash


# --wpgtk-- #
(cat $HOME/.config/wpg/sequences &)
 source ~/.cache/wal/colors.sh # Sets fzf theme and allows use of $color[n] vars in scripts

#

# ~/.bashrc
# Run by interactive shells (after /etc/bash.bashrc)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ---Prompt--- #
export PS1="\[\033[0;31m\]\u@\h\[\033[01;34m\] \W \[\033[00m\]\$ "

# ---Alias--- #
## ~/.config files ##
alias not="$EDITOR ~/Notes/notes.md"
alias ei3='ec i3'
alias epb="$EDITOR '+set syntax=dosini' ~/.config/polybar/config"
alias exr="$EDITOR ~/.Xresources"

## Common Commands ## 
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias v='vim'
alias l='ls -lah'
alias ls='ls -A --color=auto'
alias ka='killall'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias c='clear'
alias e='exit'
alias m='man'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias bt=bluetoothctl
alias wils='nmcli d wifi list'
alias wicon='nmcli d wifi connect'
alias psg='ps aux | grep'
alias open='xdg-open'
alias qemuvm='qemu-system-x86_64 -enable-kvm -vga std -m 2048 -cpu host -smp 4 -net nic,model=virtio -net user,hostfwd=tcp::2222-:22'
alias tma='tmux a -t'
alias base16-manager='~/Repos/base16-manager/base16-manager'

## Pacman ##
alias pmin='sudo pacman -S'
alias pmup='sudo pacman -Syu'
alias pmrm='sudo pacman -Rns'
alias spm='sudo pacman'
alias pm='pacman'

## Systemctl ##
alias stl='systemctl'
alias spd='systemctl suspend'
alias jnl='journalctl'

## Zathura ##
alias zth='zathura'
alias ztf='zathura --fork'

## Lots of Git (stolen) ##
alias ga='git add'
alias gaa='git add --all'
alias gap='git apply'
alias gau='git add --update'
alias gb='git branch'
alias gbD='git branch -D'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcam='git commit -a -m'
alias gcb='git checkout -b'
alias gcl='git clone --recurse-submodules'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcs='git commit -S'
alias gcsm='git commit -s -m'
alias gd='git diff'
alias gf='git fetch'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gl='git pull'
alias glg='git log --stat'
alias glgga='git log --graph --decorate --all'
alias glgp='git log --stat -p'
alias glo='git log --oneline --decorate'
alias glod='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'
alias glum='git pull upstream master'
alias gm='git merge'
alias gmom='git merge origin/master'
alias gp='git push'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grev='git revert'
alias grh='git reset'
alias grhh='git reset --hard'
alias grm='git rm'
alias grmc='git rm --cached'
alias groh='git reset origin/$(git_current_branch) --hard'
alias gru='git reset --'
alias grv='git remote -v'
alias gsd='git svn dcommit'
alias gsh='git show'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gsta='git stash push'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gsu='git submodule update'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'

alias polyrs='~/.config/polybar/launch.sh'

# ---Functions--- #

# Edit config files
function ec(){
    cfg_path="/home/colby/.config/$1/config"
    [[ -f $cfg_path ]] && vim $cfg_path; return
    echo  "No directory in ~/.config with name $1"
}

function mdv(){
    full_path=$(realpath $1) 
    html_path=$(echo $full_path | sed s/md/html/g)

    markdown $full_path > $html_path

    firefox $html_path

    rm $html_path
}

# ---Share History--- #
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


# --Use bash-completion package-- #
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# --Base16 Shell--
BASE16_SHELL="$XDG_DATA_HOME/base16-manager/chriskempson/base16-shell"
BASE16_SHELL_SET_BACKGROUND=false
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

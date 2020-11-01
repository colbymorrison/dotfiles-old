## Common Commands ## 
alias c='clear'
alias e='exit'
alias g='grep'
alias l='ls -lah'
alias m='man'
alias r='ranger'
alias v='vim'
alias ls='ls -AG'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,node_modules}'
alias pag='ps aux | grep'
alias ka='killall'
alias sbh='. ~/.bashrc'
alias qemuvm='qemu-system-x86_64 -enable-kvm -vga std -m 2048 -cpu host -smp 4 -net nic,model=virtio -net user,hostfwd=tcp::2222-:22'

## config files ##
alias not="$EDITOR ~/Notes/notes.md"
alias evi="$EDITOR ~/.vimrc"
alias ebh="$EDITOR ~/.bashrc"
alias eba="$EDITOR ~/.bash_aliases"
alias etm="$EDITOR ~/.tmux.conf"

## Directories ## 
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

## Tmux ##
alias tmat='tmux a -t'
alias tmls='tmux ls'

## systemctl ##
alias stl='systemctl'
alias jnl='journalctl'

## Network Manager ##
alias wils='nmcli d wifi list'
alias wicon='nmcli d wifi connect'

## Mac fb ##
alias d='et -r 8377:8377 dev:8080'

## Git ##
alias ga='git add'
alias gau='git add -u'
alias gaa='git add --all'
alias gb='git branch'
alias gbD='git branch -D'
alias gc='git commit -v'
alias gcam='git commit -a -m'
alias gcamd='git commit --amend'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias ggsup='git branch --set-upstream-to=origin/$(parse_git_branch)'
alias gl='git pull'
alias glg='git log --stat'
alias gm='git merge'
alias gp='git push'
alias gpsu='git push --set-upstream origin $(parse_git_branch)'
alias gst='git status'
alias ggrep='git grep'

alias fzf="fzf --preview=\"~/scripts/preview.sh {}\" --bind=\"space:toggle-preview\""

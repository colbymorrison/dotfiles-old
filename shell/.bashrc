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


# ---Prompt--- #
export PS1="\[\033[0;93m\]\u@\h\[\033[01;34m\] \W \[\033[32m\]\$(~/scripts/parse_git_branch)\[\033[00m\]$ "

# ---Alias--- #
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# --History--#
HISTFILESIZE=-1
HISTSIZE=1000000
HISTCONTROL=ignoredups
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND" # share history between open terminals

# ---Functions--- #

mkcd() {
  mkdir -p "$1" && cd "$1"
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
    wpg --theme $theme
    wal --theme $theme
}


# Fzf files in current directory
opf() {
    fle=$(fd . -t f -t d -d 1 -H | fzf -m --preview="bat {}")
    [[ -f $fle ]] && xdg-open $fle || cd $fle
    }

# Fzf all directories under ~
cdf() {
        cd "$(fd . -t d  -H '/home/cmorrison/fbcode' | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview")"
    }

checkout_fzf() {
        [ "$#" -eq 1 ] && git checkout $1 || git checkout $(git branch | fzf --height="10")
    }


# --Completion-- #
[[ -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

[[ -f $HOME/.fzf/ ]] && \
    . $HOME/.fzf/shell/completion.bash ; \
    . $HOME/.fzf/shell/key-bindings.bash

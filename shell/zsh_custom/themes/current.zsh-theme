# Edited theme based on /usr/share/oh-my-zsh/themes/alanpeabody.zsh-theme

# Stolen from fishy theme
collapsed_wd() {
    /home/colby/scripts/collapsedir.py $(pwd) 4
}

local user='%{$fg[red]%}%n@%{$fg[red]%}%m%{$reset_color%}'
local pwd='%{$fg[blue]%}$(collapsedir.py $(pwd) 4)%{$reset_color%}'
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%} $(git_prompt_info)%{$reset_color%}'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""


ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"

# Main prompt
PROMPT="${user} ${pwd} $ "

# Right prompt
RPROMPT="${return_code} ${git_branch}"

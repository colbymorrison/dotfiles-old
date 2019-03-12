#Environment Variables
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export JAVA_HOME=$(/usr/libexec/java_home)
export M2_HOME=/usr/local/apache-maven/
export M2=$M2_HOME/bin 
export PATH=$M2:$PATH
export VISUAL=vim
export EDITOR="$VISUAL"
export GOOGLE_APPLICATION_CREDENTIALS=~/Documents/Python/hq/vision-secret.json
export GOOGLE_CLOUD_PROJECT=~/Documents/Python/hq/
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

#Aliases
alias rmt="rm -r ~/.Trash/*"
alias rmd="rm -r ~/Downloads/*"
alias rmde="rm -r ~/Desktop/*"
alias cds="cd ~/Google\ Drive/Sophomore/"
alias cdn="cd ~/Google\ Drive/Sophomore/Number\ Theory/"
alias cda="cd ~/Google\ Drive/Sophomore/Algortihims/"
alias apm="~/Music/iTunes/iTunes Media/Music"
alias cdp="cd ~/Code/Python"
alias cddv='cd ~/Code/Machine-Learning/Videos/'
alias skim='/Applications/Skim.app/Contents/MacOS/Skim'
alias ls='ls -A'
alias python=python3

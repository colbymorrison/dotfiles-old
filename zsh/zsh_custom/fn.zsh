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

# Changes to a windows keyboard (swaps Control and Command keys)
# run "xmodmap ~/.Xmodmap" to switch back to mac
function winkey(){
    xmodmap -e "clear Control"
    xmodmap -e "clear Mod4"
    xmodmap -e "add Control = Control_L Control_R"
    xmodmap -e "add Mod4 = Super_L Super_R"
}

# Restarts polybar
function polyrs(){
    killall polybar
    ~/.config/polybar/launch.sh enp0s20u1 
}

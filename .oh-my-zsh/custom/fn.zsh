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

#! /bin/bash

[[ -f $1 ]] && $CATPRG --style=changes --color=always $1 || tree -L 1 $1



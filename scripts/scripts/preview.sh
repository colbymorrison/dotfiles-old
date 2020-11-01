#! /bin/bash

[[ -f $1 ]] && bat --style=changes --color=always $1 || tree -L 1 $1



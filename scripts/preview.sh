#! /bin/bash

[[ -f $1 ]] && bat --color always $1 || tree -L 1 $1

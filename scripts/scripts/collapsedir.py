#! /bin/python

# Sets filepath in custom zsh theme
# If path is greater than argv[2] collapse to fishy theme, otherwise print full path

import sys
import os

def collapse():
    # argv[1] -- path, argv[2] -- how many to collapse after
    path = sys.argv[1]
    path = path.replace(os.environ['HOME'], '~')
    split = path.split('/')

    # Paths from root
    if(split[0] == ''):
        split[0] = ' '

    if len(split) < int(sys.argv[2]):
        return path

    ret = '/'.join(d[0] for d in split[:-1])

    return f"{ret}/{split[-1]}"

if __name__ == "__main__":
    print(collapse())

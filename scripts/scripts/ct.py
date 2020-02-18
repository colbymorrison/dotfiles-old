#! /usr/bin/env python3
import os
import fileinput

def main():
    home = os.environ['HOME']
    with open(f"{home}/.tmux.conf", 'r') as f:
        lines = f.readlines()

    idx = 0
    for idx,l in enumerate(lines):
        if "COLOUR" in l:
            break
    
    tmux_path = f"{home}/dotfiles/tmux/colors/base16-{os.environ['BASE16_THEME']}.conf"

    with open(tmux_path, 'r') as tmf:
        tmad = tmf.readlines()

    lines = lines[:idx] + tmad

    with open(f"{home}/.tmux.conf", 'w') as f:
        f.write(''.join(lines))


if __name__ == "__main__":
    main()
        


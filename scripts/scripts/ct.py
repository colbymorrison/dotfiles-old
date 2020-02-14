#! /bin/python
import os
import fileinput

def main():
    with open("/home/colby/.tmux.conf", 'r') as f:
        lines = f.readlines()

    idx = 0
    for idx,l in enumerate(lines):
        if "COLOUR" in l:
            break
    
    tmux_path = f"/home/colby/dotfiles/tmux/colors/base16-{os.environ['BASE16_THEME']}.conf"

    with open(tmux_path, 'r') as tmf:
        tmad = tmf.readlines()

    lines = lines[:idx] + tmad

    with open("/home/colby/.tmux.conf", 'w') as f:
        f.write(''.join(lines))


if __name__ == "__main__":
    main()
        


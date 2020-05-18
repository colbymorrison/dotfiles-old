#! /usr/bin/env python

# Custom minimal vim package manager
# for vim 8 native package

import argparse
import os
import subprocess
import shutil

PACK_PATH = "/home/colby/.vim/pack/plugins/start" 

def add(repo):
    split = repo.split('/')
    name = split[len(split) - 1]
    subprocess.run(['git', 'clone', repo, name], cwd=PACK_PATH)

def rm(repo):
    path = f"{PACK_PATH}/{repo}"
    print(f"Are you sure you want to remove {path}? [y/n]")
    y = input()

    if(y == 'y'):
        try: 
            shutil.rmtree(f"{path}")
            print(f"{repo} removed")

        except FileNotFoundError:
            print(f"Error: {path} does not exist")

def ls():
    print('\n'.join(os.listdir(PACK_PATH)))

def update():
    for repo in os.listdir(PACK_PATH):
        print(f"Updating {repo}")
        subprocess.run(['git', 'pull'], cwd=PACK_PATH)            
        print()


def main():
   parser = argparse.ArgumentParser(description='command line args')
   parser.add_argument('action', nargs=1, choices=['ls', 'update', 'add', 'rm'])
   parser.add_argument('repo', nargs='?')
   args = parser.parse_args()

   if('ls' in args.action):
       ls()
   elif('update' in args.action):
       print("Updating vim plugins")
       update()
   else:
       if args.repo is None:
           parser.error("add and remove require repo")

       if('add') in args.action:
           add(args.repo)
       else:
           rm(args.repo)


if __name__ == "__main__":
    main()

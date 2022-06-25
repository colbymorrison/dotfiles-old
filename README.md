## Dotfiles [DEPERECATED]
Deprecated for https://github.com/colbymorrison/dotfiles

These are my dotfiles!

### Branches
There is a branch for each system I use: 
- Arch Linux, my daily machine 
- Linux, should mostly work on any fresh Linux install
- MacOs
Navigate to one of those to see the dotfiles.

This branch (`master`) has dotfiles common across all systems. To sync a single file from master to another branch run `git checkout master -- [file]`. The system-specific branches have files unique to each system (like `bashrc`).

### Installation
This repo, checked out to a system-specific branch should be cloned into `~/dotfiles`. From there, I essentially follow [this strategy](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html). Running the `link.sh` script will create symlinks to the dotfiles in the correct directory (`~` or `~/.config` usually). [GNU Stow](https://www.gnu.org/software/stow/) does most of the work for creating the symlinks, the link script simply calls `stow` on each directory in `~/dotfiles`. 

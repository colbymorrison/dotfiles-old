## Dotfiles
These are my dotfiles!

There is a branch for each system I use, navigate to one to see the dotfiles.

In general, the dotfiles should be cloned into `~/dotfiles`. From there, I essentially follow [this strategy](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html). Running the `link.sh` script will create symlinks to the dotfiles in the correct directory (`~` or `~/.config` usually). [GNU Stow](https://www.gnu.org/software/stow/) does most of the work for creating the symlinks, the link script simply calls `stow` on each directory in `~/dotfiles`. 

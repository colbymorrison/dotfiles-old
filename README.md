## Dotfiles

These are my dotfiles!

They include:

**[.gitconfig](.gitconfig)** - git configuration

**[.ohmyzsh](.ohmyzsh/custom)** - zsh custom paramaters: aliases, environment variables, etc.  

**[.vim](.vim)** - vim plugins/configuration files:
[.vim/spell](.vim/spell) contains custom dictionary entries,
[.vim/templates](.vim/templates) contains custom latex templates, they get copied into latex plugin directory after it is installed,
[.vim/after](.vim/after/ftplugin) contains custom tex plugin mappings and scripts


**[.vimrc](.vimrc)** - vim configuration & settings

**[.zshrc](.zshrc)** - zsh configuration: terminal theme, plugins, etc.

**[dotmake.sh](dotmake.sh)** - Sets up dotfiles on new computer, clone this repo into `~/dotfiles` and run this script. It installs oh-my-zsh into the `.oh-my-zsh` directory, installs vim plugins into the `.vim/bundle` directory, and sets up dotfile symlinks



## Dotfiles

These are my dotfiles!

Manage using GNU stow to symlink into home directory.
Clone into `~`. Then
```
cd ~/dotfiles
stow dir
``` for each directory `dir` in dotfiles

They include:

**[git](git)** - git configuration files

**[bash](bash)** - Bash dotfiles

**[zsh](zsh)** - .zshrc and zsh_custom directory for aliases, env variables, etc. 

**[vim](vim)** - vim configuration
[.vimrc] (vim/.vimrc) General vim configuration.
[.vim/spell](vim/.vim/spell) Custom dictionary entries.
[templates](vim/templates) Custom latex templates, should be copied into latex plugin directory after it is installed.
[.vim/after](vim/.vim/after/ftplugin) Custom tex plugin mappings and scripts

**[X11](X11)** - X11 configruation files



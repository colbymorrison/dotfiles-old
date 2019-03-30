set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on            " for vim-latex 
filetype indent on            " for vim-latex 
syntax on

" Lets
"let mapleader = "-"
let g:tex_flavor='latex'
let g:tex_no_error=1
let g:powerline_pycmd="py3"

" Settings
set spelllang=en              
set spellfile=$HOME/dotfiles/.vim/spell/en.utf-8.add
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set shellslash
set iskeyword+=:
set sw=2
set grepprg=grep\ -nH\ $*
set laststatus=2

" mappings
nmap <S-ENTER> O<Esc>
nmap <CR> o<Esc>
inoremap jj <Esc>

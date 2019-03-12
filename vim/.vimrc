set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

" Vundle
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/dotfiles/vim/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'valloric/YouCompleteMe'
" Plugin 'L9'
" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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


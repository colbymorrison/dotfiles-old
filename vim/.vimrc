set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on            " for vim-latex 
filetype indent on            " for vim-latex 

set nocompatible              " be iMproved, required
filetype off                  " required

" Only use Vundle for non-arch plugins
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"Plugin 'jwilm/i3-vim-focus'
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

" Settings
syntax on
set number
set path+=**
set spelllang=en              
set spellfile=$HOME/.vim/spell/en.utf-8.add
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
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward
inoremap jj <Esc>
"i3-vim-integration
map gwl :call Focus('right', 'l')<CR>
map gwh :call Focus('left', 'h')<CR>
map gwk :call Focus('up', 'k')<CR>
map gwj :call Focus('down', 'j')<CR>

let R_assign = 0

colo desert

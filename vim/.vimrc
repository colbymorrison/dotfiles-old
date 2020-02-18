set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on            " for vim-latex 
filetype indent on            " for vim-latex 

" Only use Vundle for non-arch plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'valloric/YouCompleteMe'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-latex/vim-latex'
Plugin 'chriskempson/base16-vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" general
syntax on
let mapleader = "\\"
set number
set path+=**
set spelllang=en              
set spellfile=$HOME/.vim/spell/en.utf-8.add
set shellslash
set mouse=a
set iskeyword+=:
set sw=2
set autoindent
set encoding=utf-8 "for ycm
hi Search ctermbg=2

" vim-latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:tex_no_error=1
let g:Tex_DefaultTargetFormat='pdf'

" Incemental search
set incsearch
set hlsearch

" Status line
set statusline=%F
set laststatus=2

"" Indents
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

" mappings
nmap <S-ENTER> O<Esc>
nmap <CR> o<Esc>
inoremap jj <Esc>

" File selection
nnoremap <leader>e :Lexplore<cr>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Tabs
nmap <C-t>j :tabn<cr>
nmap <C-t>k :tabp<cr>
nmap <C-t>t :tabnew<cr>
nmap <C-t>d :tabc<cr>

" Colors
let base16colorspace=256
if filereadable(expand("~/.vimrc_background"))
      source ~/.vimrc_background
endif

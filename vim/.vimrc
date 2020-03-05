set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on            " for vim-latex 
filetype indent on            " for vim-latex 

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
nmap <leader>c :noh<cr>
nmap <leader>f :FZF<cr>

" vim-latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:tex_no_error=1
let g:Tex_DefaultTargetFormat='pdf'

" Incemental search
set incsearch
set hlsearch

" Status line
" set statusline=%F
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
source ~/.vim/colorscheme.vim "created by base16-manager
" disables opaque background
hi Normal ctermbg=none
hi NonText ctermbg=none

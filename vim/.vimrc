set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on            " for vim-latex 
filetype indent on            " for vim-latex 

set nocompatible              " be iMproved, required
filetype off                  " required

" Lets
let mapleader = "\\"
let g:tex_flavor='latex'
let g:tex_no_error=1

" Settings
syntax on
set number
set path+=**
set spelllang=en              
set spellfile=$HOME/.vim/spell/en.utf-8.add
set mouse=a
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set shellslash
set iskeyword+=:
set sw=2
set grepprg=grep\ -nH\ $*
set incsearch
set statusline=%F
set laststatus=2
set autoindent

" mappings
nmap <S-ENTER> O<Esc>
nmap <CR> o<Esc>
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward
inoremap jj <Esc>

" File selection
nnoremap <leader>e :Lexplore<cr>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Tabs
nmap <C-t>l :tabn<cr>
nmap <C-t>h :tabp<cr>
nmap <C-t>n :tabnew<cr>
nmap <C-t>d :tabc<cr>

"i3-vim-integration
nnoremap <silent> <c-l> :call Focus('right', 'l')<CR>
nnoremap <silent> <c-h> :call Focus('left', 'h')<CR>
nnoremap <silent> <c-k> :call Focus('up', 'k')<CR>
nnoremap <silent> <c-j> :call Focus('down', 'j')<CR>

let R_assign = 0



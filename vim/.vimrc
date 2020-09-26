call plug#begin('~/.vim/plugged')

" Essentials
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'

" Colorscheme
Plug 'kaicataldo/material.vim'

call plug#end()

source $ADMIN_SCRIPTS/master.vimrc   " sets shiftwidth, tabstop, softtabstop, expandtab
let g:fb_default_opts = 0            " use my settings below


" general
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on            
filetype indent on           
syntax on
let mapleader = ","
set number
set path+=**
set spelllang=en              
set spellfile=$HOME/.vim/spell/en.utf-8.add
set shellslash
set mouse=a
set iskeyword+=:
set nofixendofline
set noerrorbells
set tags=tags;/                " no bells in terminal
set undolevels=1000
set viminfo='50,"50
set modelines=0

" Incemental search
set incsearch
set nohlsearch

" Scrolling.
set scrolljump=5    " scroll five lines at a time vertically
set sidescroll=10   " minumum columns to scroll horizontally

"" Indents
set autoindent

" mappings
nmap <S-ENTER> O<Esc>
nmap <leader>c :noh<cr>
nmap <C-p> :FZF<cr>
nmap <C-x> :close<cr>
imap <leader>f {<Esc>o}<Esc>O
nmap <leader>r :so ~/.vimrc<cr>
nmap <leader>rl :set invrelativenumber<CR> 
inoremap jj <Esc>

" Netrw
nnoremap <leader>e :Lexplore<cr>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Tabs
nmap <leader>tj :tabp<cr>
nmap <leader>tk :tabn<cr>
nmap <leader>tt :tabnew<cr>
map <leader>td  :tabc<cr>

" Signify
set updatetime=100
nmap <leader>hu :SignifyHunkUndo<cr>
nmap <leader>hp :SignifyHunkDiff<cr>

" Airline
let g:airline#extensions#hunks#enabled=0

" Colors
set background=dark
let g:material_theme_style = 'default'
color material

" BigGrep
source $ADMIN_SCRIPTS/vim/biggrep.vim

function! BigGrepFzf(query, fullscreen)
  let command_fmt = 'fbgs --ignore-case --stripdir %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Fbgs call BigGrepFzf(<q-args>, <bang>0)

" Signify
let g:signify_sign_delete = '-'

" MYC
set rtp+=/usr/local/share/myc/vim
nmap <c-p> :MYC<CR>

" ALE

nnoremap gd 

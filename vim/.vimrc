set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on            " for vim-latex 
filetype indent on            " for vim-latex 

call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-latex/vim-latex'
Plug 'mattn/emmet-vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'

call plug#end()

" general
syntax on
let mapleader = ","
set number
set path+=**
set spelllang=en              
set spellfile=$HOME/.vim/spell/en.utf-8.add
set shellslash
set mouse=a
set iskeyword+=:
set sw=2
set autoindent

" vim-latex-suite
set grepprg=grep\ -nH\ $* 
let g:tex_flavor='latex'
let g:tex_no_error=1
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf = 'zathura'
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward
let g:Tex_PromptedEnvironments='equation,equation*,align,align*,enumerate,itemize,figure,table,theorem,lemma,tikzpicture'
let g:Tex_GotoError=0 

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
nmap <leader>c :noh<cr>
nmap <leader>f :FZF<cr>
inoremap jj <Esc>


" File selection
nnoremap <leader>e :Lexplore<cr>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Tabs
nmap <leader>tj :tabp<cr>
nmap <leader>tk :tabn<cr>
nmap <leader>tt :tabnew<cr>
map <leader>td  :tabc<cr>

" YouCompleteMe
" use :ln and :lp to cycle through errors
let g:ycm_always_populate_location_list = 1 
map <leader>jc :YcmCompleter GoTo<CR>
map <leader>jf :YcmCompleter FixIt<CR>

" Colors
colo wal
" disables opaque background
hi Normal ctermbg=none
hi NonText ctermbg=none





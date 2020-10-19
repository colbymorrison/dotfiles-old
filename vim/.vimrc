set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on            " for vim-latex 
filetype indent on            " for vim-latex 

call plug#begin('~/.vim/plugged')

" Essentials
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'

" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'altercation/vim-colors-solarized'
Plug 'hzchirs/vim-material'

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
set nofixendofline

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
imap <leader>f {<Esc>o}<Esc>O
nmap <leader>r :so ~/.vimrc<cr>
nmap <leader>rl :set invrelativenumber<CR> 
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

" Colors
set background=dark
set termguicolors
colo gruvbox
let g:airline_theme='material'

" Coc
let g:coc_global_extensions = [ 'coc-python' ]

source ~/.vim/coc-config.vim


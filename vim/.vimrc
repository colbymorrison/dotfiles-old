set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on            " for vim-latex 
filetype indent on            " for vim-latex 

let colorschemes = ['gruvbox', 'nord', 'dracula', 'solarized', 'material', 'monokai']


call plug#begin('~/.vim/plugged')

" Essentials
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" LaTeX
Plug 'vim-latex/vim-latex'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'

" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'altercation/vim-colors-solarized'
Plug 'kaicataldo/material.vim'
Plug 'sickill/vim-monokai'

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
set nofixendofline
" save 1000 files' marks/registers
set viminfo='1000 

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
set autoindent
set tabstop=4
set shiftwidth=4
"replace all tabs with tabstop spaces
set expandtab 

" mappings
nmap <S-ENTER> O<Esc>
nmap <leader>c :noh<cr>
nmap <C-p> :FZF<cr>
nmap <C-x> :close<cr>
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

" Signify
set updatetime=100
nmap <leader>hu :SignifyHunkUndo<cr>
nmap <leader>hp :SignifyHunkDiff<cr>

" Airline
let g:airline#extensions#hunks#enabled=0

" Colors
set background=dark
set termguicolors

let g:material_theme_style = 'default'

source ~/.cache/wal/colors-wal.vim
" execute ':hi SignColumn guibg=' . color0

" if current colorscheme is in ~/colorschemes use it
" otherwise use wal theme
let data = readfile("/home/colby/.colorscheme")
for scheme in colorschemes
    if scheme == data[0]
        execute ':colo ' . scheme
        break
    else
        colo wal
    endif
endfor

" Coc
let g:coc_global_extensions = [ 'coc-python', 'coc-tsserver', 'coc-yaml', 'coc-css', 'coc-json', 'coc-eslint' ]

source ~/.vim/coc-config.vim


let g:polyglot_disabled = ['autoindent', 'sensible']
call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-dispatch'
Plug 'vim-scripts/a.vim'
Plug 'sheerun/vim-polyglot'
" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'altercation/vim-colors-solarized'
Plug 'hzchirs/vim-material'
Plug 'sainnhe/sonokai'
call plug#end()

" ---Vanilla vim settings---
syntax on

if filereadable("~/scripts/vim/nvim-defaults.vim")
  source ~/scripts/vim/nvim-defaults.vim
endif

" General settings
set nocompatible              " be iMproved
filetype off                  
filetype indent plugin on           
syntax enable
let mapleader=","
set number                    " line numbers
set nolist                    " hide EOL chars
set path+=**
set shellslash                " fileslash by OS
set nofixendofline            " add EOL at end of file
set noerrorbells              " no terminal bells
set tags=tags;/               " search up directory tree for tags
set undolevels=10000          " number of undos stored 
set viminfo='50,"50           " number of marks and registers saved
set modelines=0               " no modelines
set scrolloff=8               " show 8 lines below cursor
set linebreak                 " break on words
set autoindent
set mouse=a
set spelllang=en              
set spellfile=$HOME/.vim/spell/en.utf-8.add

" Search
set incsearch                 " search with typeahead
set hlsearch                  " hilight all searches 

" Scrolling
set scrolljump=5              " scroll five lines at a time vertically when at bottom
set sidescroll=10             " minumum columns to scroll horizontally

"" Indents
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set sw=2
set autoindent

" Mappings
nnoremap <C-p> :Files<CR>
nnoremap <leader>a :Rg<CR>
nmap <Enter> O<Esc>
nmap <silent> <leader>c :noh<cr>
nmap <silent> <C-x> :close<cr>
nmap <leader>s :so ~/.vimrc<cr>
nmap <silent> <leader>p :set invpaste<CR>
nmap <silent> <leader>r :set invrelativenumber<CR> 
imap <leader>f {<Esc>o}<Esc>O
" Go no next/prev method name in python
nmap [w [mw
nmap ]w ]mw
nmap <leader>tj :tabp<cr>
nmap <leader>tk :tabn<cr>
nmap <leader>tt :tabnew<cr>
nmap <leader>td :tabc<cr>
" Tab complete for deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
nnoremap <silent> <leader>y :call system('pbcopy', @0)<CR>


" Netrw
nnoremap <leader>e :Lexplore<cr>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Colors
set background=dark
let g:sonokai_disable_italic_comment = 1
colo sonokai

"--- Plugins ----
" Signify
set updatetime=100
nmap <leader>hu :SignifyHunkUndo<cr>
nmap <leader>hp :SignifyHunkDiff<cr>
let g:signify_sign_delete = '-'

" Airline
let g:airline#extensions#hunks#enabled=0

" Deoplete
"let g:deoplete#enable_at_startup = 1

"Vim-latex-suite
set grepprg=grep\ -nH\ $* 
let g:tex_flavor='latex'
let g:tex_no_error=1
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf = 'zathura'
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward
let g:Tex_PromptedEnvironments='equation,equation*,align,align*,enumerate,itemize,figure,table,theorem,lemma,tikzpicture'
let g:Tex_GotoError=0 

" ALE
"let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 1
let g:ale_set_balloons = 1

nmap gd <Plug>(ale_go_to_definition)
nmap gy <Plug>(ale_go_to_type_definition)
nmap gr <Plug>(ale_find_references)

nmap <leader>j <Plug>(ale_next_wrap)
nmap <leader>k <Plug>(ale_previous_wrap)
nmap <leader>v <Plug>(ale_detail)
nmap <leader>f :ALEFix<cr>
" doesn't really work?
nmap <silent> <leader>n :ALERename<cr>

" FZF
nmap <silent> <leader>z :History<cr>
nmap <silent> <leader>b :Buffers<cr>

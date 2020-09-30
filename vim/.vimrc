call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'vim-scripts/a.vim'
Plug 'ervandew/supertab'
" Deoplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
" Colorscheme
Plug 'kaicataldo/material.vim'
Plug 'morhetz/gruvbox'

call plug#end()

" ---Vanilla vim settings---
source $LOCAL_ADMIN_SCRIPTS/master.vimrc   " sets shiftwidth, tabstop, softtabstop, expandtab
                                           " read the top of this file for
                                           " info about local admin scripts
let g:fb_default_opts = 0                  " use my settings below

" General settings
set nocompatible              " be iMproved
filetype off                  
filetype plugin on            
filetype indent on           
syntax on
let mapleader = ","
set number
set path+=**,~/fbcode
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
set scrolljump=5    " scroll five lines at a time vertically when at bottom
set sidescroll=10   " minumum columns to scroll horizontally

"" Indents
set autoindent

" mappings
nmap <S-ENTER> O<Esc>
nmap <leader>c :noh<cr>
nmap <C-p> :FZF<cr>
nmap <C-x> :close<cr>
imap <leader>f {<Esc>o}<Esc>O
nmap <leader>s :so ~/.vimrc<cr>
nmap <leader>r :set invrelativenumber<CR> 
nmap <leader>p :set invpaste<CR>
imap <C-f> <C-f><C-x>

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

" Colors
set background=dark
let g:material_theme_style = 'default'
color gruvbox

"--- Local Admin Scripts ---
" BigGrep
source $ADMIN_SCRIPTS/vim/biggrep.vim

" BG with fzf doesn't work great
function! BigGrepFzf(query, fullscreen)
  let command_fmt = 'fbgs --ignore-case --stripdir %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Fbgs call BigGrepFzf(<q-args>, <bang>0)

source $LOCAL_ADMIN_SCRIPTS/vim/pyre.vim
" source $LOCAL_ADMIN_SCRIPTS/vim/supertab.vim
source $LOCAL_ADMIN_SCRIPTS/vim/toggle_comment.vim
unmap C
noremap <leader>c :call ToggleComment()<CR>

"--- Plugins ----
" Signify
set updatetime=100
nmap <leader>hu :SignifyHunkUndo<cr>
nmap <leader>hp :SignifyHunkDiff<cr>
let g:signify_sign_delete = '-'

" Airline
let g:airline#extensions#hunks#enabled=0

" MYC
set rtp+=/usr/local/share/myc/vim
nmap <c-p> :MYC<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1

" ALE
"let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 1
let g:ale_set_balloons = 1

nmap gd <Plug>(ale_go_to_definition)
nmap gy <Plug>(ale_go_to_type_definition)
nmap gr <Plug>(ale_find_references)

nmap <leader>j <Plug>(ale_previous_wrap)
nmap <leader>k <Plug>(ale_next_wrap)
nmap <leader>d <Plug>(ale_detail)

nnoremap <leader>f :ALEFix<cr>

nnoremap <silent> <leader>n :ALERename<cr>


" See https://www.internalfb.com/intern/wiki/Users/nickdavies/
" to set up for real
autocmd BufNewFile,BufRead TARGETS let b:ale_fixers = ['buckformat']
" In progress: gf for @fbcode_macros
autocmd BufNewFile,BufRead TARGETS setlocal path+=,~/fbcode/tools 
" In TARGETS files, on go to file (gf), replace //PATH with PATH/TARGETS
autocmd BufNewFile,BufRead TARGETS setlocal includeexpr=substitute(v:fname,'//\\(.*\\)','\\1/TARGETS','g')

" Supertab
let g:SuperTabDefaultCompletionType = "context"

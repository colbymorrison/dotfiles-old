call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-dispatch'
" C++
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/a.vim'
" Deoplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'kaicataldo/material.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" ---Vanilla vim settings---
let g:fb_default_opts = 0                  " use my settings below
" read the top of this file for info about local admin scripts
source $LOCAL_ADMIN_SCRIPTS/master.vimrc   " sets shiftwidth, tabstop, softtabstop, expandtab


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
set path+=**,~/fbcode         " goto fbcode files
set spelllang=en              
set shellslash                " fileslash by OS
set mouse=a
set iskeyword+=:
set nofixendofline            " add EOL at end of file
set noerrorbells              " no terminal bells
set tags=tags;/               " search up directory tree for tags
set undolevels=10000          " number of undos stored 
set viminfo='50,"50
set modelines=0
set scrolloff=8               " show 8 lines below cursor
set linebreak                 " break on words
set spellfile=$HOME/.vim/spell/en.utf-8.add

" Search
set incsearch                 " search with typeahead
set hlsearch                  " hilight all searches 

" Scrolling
set scrolljump=5              " scroll five lines at a time vertically when at bottom
set sidescroll=10             " minumum columns to scroll horizontally

"" Indents
set autoindent

" Mappings
nmap <Enter> O<Esc>
nmap <silent> <leader>c :noh<cr>
nmap <C-x> :close<cr>
nmap <leader>s :so ~/.vimrc<cr>
nmap <leader>p :set invpaste<CR>
nmap <leader>r :set invrelativenumber<CR> 
" Fbgs word under cursor
nmap <leader>g :Fbgs <C-R><C-W><CR>   
imap <leader>f {<Esc>o}<Esc>O
" Go no next/prev method name in python
nmap [w [mw
nmap ]w ]mw
" arc lint current file
nnoremap <leader>l :exec '!arc lint -a %'<cr>
nmap <leader>tj :tabp<cr>
nmap <leader>tk :tabn<cr>
nmap <leader>tt :tabnew<cr>
nmap <leader>td :tabc<cr>
" go to nearest TARGETS
nmap <leader>w :tabnew !~/bin/tgt.sh<cr>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>


" Autocmds
" Arc lint current file on write 
"autocmd BufWritePost *.py,*.cpp,*.rs,TARGETS,*.thrift silent! exec '!arc lint -a %' | :e 
" Format TARGETS on save, stolen from P75711758, lots of good stuff here
autocmd BufWritePost TARGETS silent! exec
      \ '!~/fbsource/tools/third-party/buildifier/run_buildifier.py -i %' | :e
" In TARGETS files, on go to file (gf), replace //PATH with PATH/TARGETS
autocmd BufNewFile,BufRead TARGETS setlocal includeexpr=substitute(v:fname,'//\\(.*\\)','\\1/TARGETS','g')
" In progress: gf for @fbcode_macros
"autocmd BufNewFile,BufRead TARGETS setlocal path+=,~/fbcode/tools 

" Compiler
if getcwd() =~ '/fbsource/fbcode$'
  comp buck
endif

" Netrw
nnoremap <leader>e :Lexplore<cr>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Colors
let g:material_theme_style = 'ocean'

colo dracula
let g:airline_theme='dracula'


"--- Local Admin Scripts ---
function! BigGrepFzf(query, fullscreen)
  let command_fmt = 'fbgs --ignore-case --stripdir %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Fbgs call BigGrepFzf(<q-args>, <bang>0)

source $LOCAL_ADMIN_SCRIPTS/vim/pyre.vim
source $LOCAL_ADMIN_SCRIPTS/vim/toggle_comment.vim
source $LOCAL_ADMIN_SCRIPTS/vim/biggrep.vim
noremap <leader>m :call ToggleComment()<CR>

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

" FZF or MYC depending on dir (stolen P75711758)
if getcwd() =~ '/fbsource/fbcode$'
  nnoremap <leader>a :Fbgs<Space>
  nnoremap <C-p> :MYC<CR>
elseif getcwd() =~ '/configerator'
  nnoremap <leader>a :CBGS<Space>
  nnoremap <C-p> :Files<CR>
else
  nnoremap <Leader>a :Rg<CR>
  nnoremap <C-p> :Files<CR>
endif

" Deoplete
let g:deoplete#enable_at_startup = 1

" ALE
let g:ale_disable_lsp = 1
"let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 1
let g:ale_set_balloons = 1

nmap gd <Plug>(ale_go_to_definition)
nmap gy <Plug>(ale_go_to_type_definition)
nmap gr <Plug>(ale_find_references)

nmap <leader>j <Plug>(ale_next_wrap)
nmap <leader>k <Plug>(ale_previous_wrap)
nmap <leader>d <Plug>(ale_detail)
nnoremap <leader>f :ALEFix<cr>
" doesn't really work?
nnoremap <silent> <leader>n :ALERename<cr>

" FZF
nmap <silent> <leader>z :History<cr>
nmap <silent> <leader>b :Buffers<cr>

let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1


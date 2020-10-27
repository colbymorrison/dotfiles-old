set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

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
nmap <Enter> O<Esc>
nmap <silent> <leader>c :noh<cr>
nmap <leader>s :so ~/.vimrc<cr>
imap <leader>f {<Esc>o}<Esc>O
" Go no next/prev method name in python
nmap [w [mw
nmap ]w ]mw
nmap <leader>tj :tabp<cr>
nmap <leader>tk :tabn<cr>
nmap <leader>tt :tabnew<cr>
nmap <leader>td :tabc<cr>

if exists('g:vscode')
    nmap gr :call VSCodeNotify("editor.action.goToReferences")<cr>
    nmap <leader>j :call VSCodeNotify("editor.action.marker.next")<cr>
    nmap <leader>k :call VSCodeNotify("editor.action.marker.prev")<cr>
    nmap <leader>d :close<cr>
    nmap <leader>f :call VSCodeNotify("editor.action.formatDocument")<cr>
    nmap <leader>n :call VSCodeNotify("editor.action.rename")<cr>
    nmap <leader>w :call VSCodeNotify("buck.lsp.open_nearest_buck_file")<cr>
    nmap [c :call VSCodeNotify("workbench.action.editor.nextChange")<cr>
    nmap ]c :call VSCodeNotify("workbench.action.editor.previousChange")<cr>
    nmap <leader>hu :call VSCodeNotify("fb-hg.revertHunk")<cr>
    nmap <leader>hp :call VSCodeNotify("editor.action.dirtydiff.next")<cr>
    nmap <C-w>v :call VSCodeNotify("workbench.action.splitEditorRight")<cr>
    nmap <C-w>s :call VSCodeNotify("workbench.action.splitEditorDown")<cr>
    nmap <C-k> :call VSCodeNotify("workbench.action.focusAboveGroup")<cr>
    nmap <C-j> :call VSCodeNotify("workbench.action.focusBelowGroup")<cr>
    nmap <C-h> :call VSCodeNotify("workbench.action.focusLeftGroup")<cr>
    nmap <C-l> :call VSCodeNotify("workbench.action.focusLeftGroup")<cr>
    command A call VSCodeNotify("cpp:switch-header-source")<cr>
endif

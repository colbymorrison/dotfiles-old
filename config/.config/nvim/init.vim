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

" Mappings for VSCode integration
nmap <Enter> O<Esc>
nmap <silent> <leader>c :noh<cr>
nmap <C-x> :close<cr>
nmap <leader>s :so ~/.vimrc<cr>
nmap <leader>p :set invpaste<CR>
nmap <leader>r :set invrelativenumber<CR> 
imap <leader>f {<Esc>o}<Esc>O
" Go no next/prev method name in python
nmap [w [mw
nmap ]w ]mw
nmap <leader>tj :tabp<cr>
nmap <leader>tk :tabn<cr>
nmap <leader>tt :tabnew<cr>
nmap <leader>td :tabc<cr>

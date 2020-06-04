set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on            " for vim-latex 
filetype indent on            " for vim-latex 

call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-latex/vim-latex'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'deviantfero/wpgtk.vim'
Plug 'tpope/vim-fugitive'
Plug 'posva/vim-vue'

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

" Status line
set statusline=%f
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
nmap <leader>r :so ~/.vimrc<cr>
inoremap jj <Esc>


" File selection
nnoremap <leader>e :Lexplore<cr>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Tabs
nmap <leader>tj :tabp<cr>
nmap <leader>tk :tabn<crk
nmap <leader>tt :tabnew<cr>
map <leader>td  :tabc<cr>

" Colors
colo wal
hi Normal ctermbg=none
hi NonText ctermbg=none

" Coc
" More options in Coc readme but let's try these for now
let g:coc_global_extensions = [ 'coc-python', 'coc-tsserver', 'coc-yaml', 'coc-css', 'coc-json' ]

set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>mt  <Plug>(coc-format-selected)
nmap <leader>mt  <Plug>(coc-format-selected)

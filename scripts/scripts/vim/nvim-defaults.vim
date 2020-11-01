"Set neovim defaults if not neovim
if !has("nvim")
	set autoindent
	set autoread
	set background=dark
	set backspace=indent,eol,start
	set backupdir=$HOME/.vim/backup
	set belloff=all
	set complete-=i
	set cscopeverbose
	set directory=$HOME/.vim/swap
	set display=lastline,msgsep
	set encoding=UTF-8
	set fillchars+=vert:│
	set nofsync
	set formatoptions=tcqj
	set history=10000
	set hlsearch
	set incsearch
	set langnoremap
	set nolangremap
	set laststatus=2
	set listchars=tab:> ,trail:-,nbsp:+
	set nocompatible
	set nrformats=bin,hex
	set ruler
	set sessionoptions-=options
	set shortmess+=F
	set showcmd
	set sidescroll=1
	set smarttab
	set tabpagemax=50
	set tags=./tags;,tags
	set ttimeoutlen=50
	set ttyfast
	set undodir=$HOME/.vim/undo/
	set viminfo-=!
	set wildmenu
endif



" NeoBundle
if has('vim_starting')
	if &compatible
		set nocompatible               " Be iMproved
	endif

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
filetype plugin indent on

" Load and check bundles
source ~/.vim/bundles
NeoBundleCheck
" /NeoBundle

" General
syntax on
set t_Co=256
syntax enable

" Key bindings
let mapleader = ","																		" Remap leader key

" Theme
set background=dark
colorscheme solarized
let g:solarized_termtrans = 1
let g:solarized_visibility="high"
let g:solarized_termcolors=256
set guifont=Inconsolata-dz\ for\ Powerline:h12

" UI
set cursorline
set number
set laststatus=2																			" Always show status line
hi CursorLineNR ctermfg=red
set scrolloff=8
set linespace=0

set noswapfile 																				" Disabled swap file


" Formatting
set shiftwidth=2
set tabstop=2

" Search
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase
set splitright
set splitbelow

set history=1000
set hidden
set ttyfast
set lazyredraw

set backspace=indent,eol,start


" Plugins
source ~/.vim/plugins.vim

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

source ~/.vim/bundles

NeoBundleCheck
" /NeoBundle

syntax on
set t_Co=256
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termtrans = 1
let g:solarized_visibility="high"
let g:solarized_termcolors=256
set guifont=Inconsolata-dz\ for\ Powerline:h12
set cursorline

set scrolloff=8
set linespace=0
hi CursorLineNR ctermfg=red

set noswapfile

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

" Remap leader
let mapleader = ","

set number
set history=1000
set hidden
set ttyfast
set lazyredraw

set backspace=indent,eol,start


" Plugins
" NERDTree
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>

let NERDTreeShowBookmarks=0
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let NERDTreeShowLineNumbers=0
let NERDTreeQuitOnOpen=1


" Airline
let g:airline_theme="badwolf"
let g:airline_powerline_fonts = 1
let g:airline_left_sep='⮀'
let g:airline_right_sep='⮂'


" Fugitive
map <leader>gs :Gstatus<CR>
map <leader>vmp :VimuxPromptCommand<CR>
map <leader>vm :VimuxRunLastCommand<CR>

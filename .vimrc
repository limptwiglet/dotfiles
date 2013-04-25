filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible
set modelines=0

set guioptions-=M
set guioptions-=r
set guioptions-=L
set guioptions-=T
set ts=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set statusline=%<\:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

colorscheme molokai
set guifont=Monaco:h13
set guioptions-=Tr
set ai
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set number

map <leader>b :BufExplorer<CR>
map <leader>p :NERDTreeToggle<CR>
map <leader>f :FufFile<CR>

inoremap jj <ESC>

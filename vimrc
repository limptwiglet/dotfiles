set nocompatible               " Be iMproved
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

source ~/.vim/bundles

filetype plugin indent on			" Needed for NeoBundle


" Editor Settings
    syntax on
	" Style
	set t_Co=256

	syntax enable
	set background=dark
	colorscheme solarized
	let g:solarized_termtrans = 1
	let g:solarized_visibility="high"
	let g:solarized_termcolors=256

    set guifont=Monaco:h12

	set cursorline					" highlight current line
	set cursorcolumn                		" highlight current column
	set scrolloff=8					" min lines to keep above and below cursor
	set linespace=0					" No extra spaces between rows
	hi CursorLineNR ctermfg=red 			" Highlight column 80

    set noswapfile                  " Disable swap file

	" General
	set incsearch					" find as you type search
	set hlsearch					" highlight search terms"
	set number
	set history=1000
	set hidden
	set ttyfast
	set lazyredraw

	set laststatus=2

	set guioptions-=r
	set guioptions-=L

	" Editing
    set tabstop=4     				" a tab is four spaces
	set backspace=indent,eol,start 	" allow backspacing over everything in insert mode
	set autoindent    				" always set autoindenting on
	set copyindent    				" copy the previous indentation on autoindenting
    set shiftwidth=4  				" number of spaces to use for autoindenting
    set shiftround    				" use multiple of shiftwidth when indenting with '<' and '>'
	set showmatch     				" set show matching parenthesis
	set ignorecase    				" ignore case when searching
	set smartcase     				" ignore case if search pattern is all lowercase, case-sensitive otherwise
	set smarttab      				" insert tabs on the start of a line according to shiftwidth, not tabstop
	set expandtab

	" Key mappings
	let mapleader = ","
	" Easier moving in tabs and windows
	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <C-L> <C-W>l<C-W>_
	map <C-H> <C-W>h<C-W>_"

	imap jj <Esc>

" Auto commands
	" Remove trailing white space
	autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
	autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig


" Filetype
    autocmd FileType stylus setlocal shiftwidth=2 tabstop=2


" Plugin settings
	" NERDTree
	map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
	map <leader>e :NERDTreeFind<CR>

	let NERDTreeShowBookmarks=1
	let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
	let NERDTreeChDirMode=0
	let NERDTreeMouseMode=2
	let NERDTreeShowHidden=1
	let NERDTreeKeepTreeInNewTab=1
	let g:nerdtree_tabs_open_on_gui_startup=0
	let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

	" Powerline
	"let g:Powerline_symbols = 'fancy'

	" CtrlP
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

	" Syntastic
    let g:syntastic_warning_symbol='⚠'
	
	"-------------------------------------------------------------------
	"" NeoComplCache
	"-------------------------------------------------------------------
        " Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
        let g:acp_enableAtStartup = 1
        " Launches neocomplcache automatically on vim startup.
        let g:neocomplcache_enable_at_startup = 1
        " Use smartcase.
        let g:neocomplcache_enable_smart_case = 1
        " Use camel case completion.
        let g:neocomplcache_enable_camel_case_completion = 1
        " Use underscore completion.
        let g:neocomplcache_enable_underbar_completion = 1
        " Sets minimum char length of syntax keyword.
        let g:neocomplcache_min_syntax_length = 3
        " buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
        let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endif

	"-------------------------------------------------------------------
	"" NeoSnippet
	"-------------------------------------------------------------------
	let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_auto_delimiter = 1
    let g:neocomplete#max_list = 15
    let g:neocomplete#force_overwrite_completefunc = 1	
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'
	imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)

    " Enable omnicompletion
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

    let g:neocomplete#sources#omni#input_patterns = {}

    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

    let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

    let g:neosnippet#enable_snipmate_compatibility = 1

    set completeopt-=preview


    " Statline
    let g:statline_fugitive = 1


    " Fugitive
	map <leader>gs :Gstatus<CR>


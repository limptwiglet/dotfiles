set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'thisivan/vim-bufexplorer'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Townk/vim-autoclose'
Bundle 'belike81/vim-bufkill'
Bundle 'Lokaltog/vim-powerline'
Bundle 'myusuf3/numbers.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'epeli/slimux'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/csapprox'
Bundle 'nerdtree-ack'


filetype plugin indent on

syntax on
set t_Co=256

" Theme
syntax enable
set background=dark
colorscheme solarized
let g:solarized_visibility="high"

set guifont=Monaco\ for\ Powerline:h12

set history=1000
set hidden

set noswapfile

set linespace=0					" No extra spaces between rows
set incsearch					" find as you type search
set hlsearch					" highlight search terms"
set number

set cursorline					" highlight current line
set cursorcolumn                " highlight current column
set scrolloff=3					" min lines to keep above and below cursor

" Formatting {
	set tabstop=4     " a tab is four spaces
	set backspace=indent,eol,start " allow backspacing over everything in insert mode
	set autoindent    " always set autoindenting on
	set copyindent    " copy the previous indentation on autoindenting
	set shiftwidth=4  " number of spaces to use for autoindenting
	set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
	set showmatch     " set show matching parenthesis
	set ignorecase    " ignore case when searching
	set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
	set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
	set expandtab

    hi CursorLineNR ctermfg=red 

	" Remove trailing whitespace
	autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
	autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
" }

" Key remappings {
	let mapleader = ","
	" Easier moving in tabs and windows
	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <C-L> <C-W>l<C-W>_
	map <C-H> <C-W>h<C-W>_"

	imap jj <Esc>
" }

" Plugins {
	" NERDTree {
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
	" }

	" Buffer explorer {
		nmap <leader>b :BufExplorer<CR>
	" }

    " ctrlp {
        let g:ctrlp_working_path_mode = 2
        nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|)|documentation|node_modules$',
            \ 'file': '\.exe$\|\.so$\|\.dll$' }
     " }
    
    " Fugitive {
        map <leader>gs :Gstatus<CR>
    " }
    
    " Powerline {
        let g:Powerline_symbols = 'fancy'
    " }

    " Neocomplcache {
        " Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
        let g:acp_enableAtStartup = 0
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
    " }
    
    " Neocomplcache snippet {
        " Plugin key-mappings.
        imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        smap <C-k>     <Plug>(neosnippet_expand_or_jump)
        xmap <C-k>     <Plug>(neosnippet_expand_target)

        " SuperTab like snippets behavior.
        imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: pumvisible() ? "\<C-n>" : "\<TAB>"
        smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"

        " For snippet_complete marker.
        if has('conceal')
        set conceallevel=2 concealcursor=i
        endif
    " }
" }

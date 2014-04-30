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

    set guifont=Inconsolata-dz\ for\ Powerline:h12

	" Change cursor shape in insert mode
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

	set cursorline					" highlight current line
	"set cursorcolumn                		" highlight current column
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
	set noexpandtab
	set nojoinspaces
	set splitright
	set splitbelow

	" Key mappings
	let mapleader = ","
	" Easier moving in tabs and windows
	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <C-L> <C-W>l<C-W>_
	map <C-H> <C-W>h<C-W>_"

	" Find merge conflict markers
	map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

	imap jj <Esc>

" Auto commands
	" Remove trailing white space
	autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
	autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

	" Python 
	autocmd FileType python setl ts=4 sts=4 shiftwidth=4 smarttab expandtab

	"au BufNewFile,BufRead *.emblem set filetype=emblem


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
	let NERDTreeShowLineNumbers=0
	let NERDTreeQuitOnOpen=1

	" { Airline
		let g:airline_theme="badwolf"
		let g:airline_powerline_fonts = 1
		let g:airline_left_sep='⮀'
		let g:airline_right_sep='⮂'
    " }

	" { CtrlP
        let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
    " }

	" { Syntastic
        let g:syntastic_warning_symbol='⚠'
        let g:syntastic_error_symbol='✹'
    " }
	
	" NeoComplCache {
        "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        " Use neocomplcache.
        let g:neocomplcache_enable_at_startup = 1
        " Use smartcase.
        let g:neocomplcache_enable_smart_case = 1
        " Set minimum syntax keyword length.
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

        " Enable heavy features.
        " Use camel case completion.
        "let g:neocomplcache_enable_camel_case_completion = 1
        " Use underbar completion.
        "let g:neocomplcache_enable_underbar_completion = 1

        " Define dictionary.
        let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
            let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings.
        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-l>     neocomplcache#complete_common_string()

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
        return neocomplcache#smart_close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        endfunction
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()
        " Close popup by <Space>.
        "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

        " For cursor moving in insert mode(Not recommended)
        "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
        "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
        "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
        "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
        " Or set this.
        "let g:neocomplcache_enable_cursor_hold_i = 1
        " Or set this.
        "let g:neocomplcache_enable_insert_char_pre = 1

        " AutoComplPop like behavior.
        "let g:neocomplcache_enable_auto_select = 1

        " Shell like behavior(not recommended).
        "set completeopt+=longest
        "let g:neocomplcache_enable_auto_select = 1
        "let g:neocomplcache_disable_auto_complete = 1
        "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

        " For perlomni.vim setting.
        " https://github.com/c9s/perlomni.vim
        let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


		imap <C-k>     <Plug>(neosnippet_expand_or_jump)
		smap <C-k>     <Plug>(neosnippet_expand_or_jump)
		xmap <C-k>     <Plug>(neosnippet_expand_target)
    " }

    " Statline
    let g:statline_fugitive = 1


    " Fugitive
	map <leader>gs :Gstatus<CR>

	map <leader>vmp :VimuxPromptCommand<CR>
	map <leader>vm :VimuxRunLastCommand<CR>


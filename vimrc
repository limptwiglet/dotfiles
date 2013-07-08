 set nocompatible               " Be iMproved

 if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

 NeoBundle 'Shougo/vimproc', { 'build': {
       \   'windows': 'make -f make_mingw32.mak',
       \   'cygwin': 'make -f make_cygwin.mak',
       \   'mac': 'make -f make_mac.mak',
       \   'unix': 'make -f make_unix.mak',
       \ } }


" Packages
    " Fuzzy Searches
    NeoBundle 'mileszs/ack.vim'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/unite-outline'
    NeoBundle 'Shougo/unite-help'
    NeoBundle 'Shougo/unite-session'
    NeoBundle 'thinca/vim-unite-history'

	" Version Control
	NeoBundle 'tpope/vim-fugitive'

	" Movement
	NeoBundle 'Lokaltog/vim-easymotion'

	" Style
	NeoBundle 'altercation/vim-colors-solarized'
	"NeoBundle 'Lokaltog/vim-powerline'
    NeoBundle 'bling/vim-airline'
	"NeoBundle 'millermedeiros/vim-statline'
	NeoBundle 'myusuf3/numbers.vim'

	" Editing
	NeoBundle 'tpope/vim-surround'
	NeoBundle 'scrooloose/nerdcommenter'
	NeoBundle 'Townk/vim-autoclose'
	"NeoBundle 'Shougo/neocomplcache.vim'
	NeoBundle 'Valloric/YouCompleteMe'

	" Syntax
	NeoBundle 'scrooloose/syntastic'
	NeoBundle 'wavded/vim-stylus'
	NeoBundle 'jelera/vim-javascript-syntax'
	NeoBundle 'tsaleh/vim-matchit'
	NeoBundle 'nono/vim-handlebars'

	" Snippets
    NeoBundle 'SirVer/ultisnips'
	"NeoBundle  'Shougo/neosnippet.vim'

	" File Navigation
	NeoBundle 'scrooloose/nerdtree'
	NeoBundle 'tyok/nerdtree-ack'
	NeoBundle 'thisivan/vim-bufexplorer'
	NeoBundle 'vim-scripts/bufkill.vim'
	NeoBundle 'kien/ctrlp.vim'

	" Shel
	NeoBundle 'Shougo/vimshell.vim'

	"NeoBundle 'christoomey/vim-tmux-navigator'


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
	let g:solarized_contract="high"
	let g:solarized_termcolors=256

	if has("gui_running")
        set guifont=Monaco:h12
	else
        set guifont=Inconsolata-dz-Powerline:h12
    endif

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

    " NeoSnippet
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

    " Unite
    " Use the fuzzy matcher for everything
    call unite#filters#matcher_default#use(['matcher_fuzzy'])

    " Use the rank sorter for everything
    call unite#filters#sorter_default#use(['sorter_rank'])

    " Set up some custom ignores
    call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
          \ 'ignore_pattern', join([
          \ '\.git/',
          \ 'git5/.*/review/',
          \ 'google/obj/',
          \ ], '\|'))

    " Map space to the prefix for Unite
    nnoremap [unite] <Nop>
    nmap <space> [unite]

    " General fuzzy search
    nnoremap <silent> [unite]<space> :<C-u>Unite
          \ -buffer-name=files buffer file_mru bookmark file_rec/async<CR>

    " Quick registers
    nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

    " Quick buffer and mru
    nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=buffers buffer file_mru<CR>

    " Quick yank history
    nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>

    " Quick outline
    nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

    " Quick sessions (projects)
    nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>

    " Quick sources
    nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>

    " Quick snippet
    nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets snippet<CR>

    " Quickly switch lcd
    nnoremap <silent> [unite]d
          \ :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru<CR>

    " Quick file search
    nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

    " Quick grep from cwd
    nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>

    " Quick help
    nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help help<CR>

    " Quick line using the word under cursor
    nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

    " Quick MRU search
    nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

    " Quick find
    nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>

    " Quick commands
    nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

    " Quick bookmarks
    nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>

    " Fuzzy search from current buffer
    " nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir
          " \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>

    " Quick commands
    nnoremap <silent> [unite]; :<C-u>Unite -buffer-name=history history/command command<CR>

    " Start in insert mode
    let g:unite_enable_start_insert = 1

    " Enable short source name in window
    " let g:unite_enable_short_source_names = 1

    " Enable history yank source
    let g:unite_source_history_yank_enable = 1

    " Open in bottom right
    let g:unite_split_rule = "botright"

    " Shorten the default update date of 500ms
    let g:unite_update_time = 200

    let g:unite_source_file_mru_limit = 1000
    let g:unite_cursor_line_highlight = 'TabLineSel'
    " let g:unite_abbr_highlight = 'TabLine'

    let g:unite_source_file_mru_filename_format = ':~:.'
    let g:unite_source_file_mru_time_format = ''

    " For ack.
    if executable('ack-grep')
      let g:unite_source_grep_command = 'ack-grep'
      " Match whole word only. This might/might not be a good idea
      let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
      let g:unite_source_grep_recursive_opt = ''
    elseif executable('ack')
      let g:unite_source_grep_command = 'ack'
      let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
      let g:unite_source_grep_recursive_opt = ''
    endif

    " VimShell
    let g:vimshell_editor_command="/usr/local/Cellar/macvim/7.3-66/bin/mvim"


    " Statline
    let g:statline_fugitive = 1


    " Fugitive
	map <leader>gs :Gstatus<CR>


	"-------------------------------------------------------------------
	"" YouCompleteMe
	"-------------------------------------------------------------------
    let g:ycm_autoclose_preview_window_after_completion=1

   " Enable omni completion
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType java setlocal omnifunc=eclim#java#complete#CodeComplete


NeoBundleCheck

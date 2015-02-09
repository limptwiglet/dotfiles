" NeoBundle

if has('vim_starting')
	if &compatible
		set nocompatible               " Be iMproved
	endif

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

source ~/.vim/bundles

call neobundle#begin(expand('~/.vim/bundle/'))
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
" /NeoBundle

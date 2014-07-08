" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set number								"Line numbers are good
set backspace=indent,eol,start	"Allow backspace in insert mode
set history=1000						"Store lots of :cmdline history
set showcmd								"Show incomplete cmds down the bottom
set showmode							"Show current mode down the bottom
set gcr=a:blinkon0					"Disable cursor blink
set visualbell							"No sounds
set autoread							"Reload files changed outside vim

set incsearch							"find the next match as we type the search

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden								"hide buffers when not displayed

"turn on syntax highlighting
syntax on

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
	silent !mkdir ~/.vim/backups > /dev/null 2>&1
	set undodir=~/.vim/backups
	set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=3
set softtabstop=3
set tabstop=3
"set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set list!

" ================ Folds ============================

set foldmethod=indent	"fold based on indent
set foldnestmax=3			"deepest fold is 3 levels
set nofoldenable			"dont fold by default

" ================ Completion =======================

set wildmode=list:longest		"make cmdline tab completion similar to bash
set wildmenu						"enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~	"stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8			"Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" ================ Custom Settings ========================
"so ~/.yadr/vim/settings.vim
execute pathogen#infect()
"Helptags
so ~/.vim/settings.vim
let g:airline_theme='murmur'
let g:solarized_termcolors=256

colorscheme solarized
set ignorecase						"set search to be case insensitive
set smartcase						"unless you typed uppercase letters in your query
command ZZ w|execute "!git add --all && git commit -m updated && git push"
set colorcolumn=81
set laststatus=2
set background=dark
set listchars=tab:▸\ ,eol:¬
set showbreak=…



" ========= Configuring Fonts for gvim =======
if has("gui_running")
	if has("gui_gtk2")
	 set guifont=Consolas\ 14
	elseif has("gui_macvim")
	 set guifont=Menlo\ Regular:h14
	elseif has("gui_win32")
	 set guifont=Consolas:h11:cANSI
	endif
endif

" =========== Extending wrap functionality ========= 

function ToggleWrap(show)
	if &wrap
		setlocal nowrap
		set virtualedit=all
		set columns=120
		silent! nunmap <buffer> <Up>
		silent! nunmap <buffer> <Down>
		silent! nunmap <buffer> <Home>
		silent! nunmap <buffer> <End>

		silent! iunmap <buffer> <Up>
		silent! iunmap <buffer> <Down>
		silent! iunmap <buffer> <Home>
		silent! iunmap <buffer> <End>
		if a:show
			echom "Wrap OFF"
		endif
	else
		setlocal wrap linebreak nolist
		set virtualedit=block
		setlocal display+=lastline
		set columns=86
		noremap	<buffer> <silent> <Up>		gk
		noremap	<buffer> <silent> <Down>	gj
		noremap	<buffer> <silent> <Home>	g<Home>
		noremap	<buffer> <silent> <End>		g<End>
		noremap  <buffer> <silent> k gk
		noremap  <buffer> <silent> j gj
		noremap  <buffer> <silent> 0 g0
		noremap  <buffer> <silent> $ g$
		inoremap <buffer> <silent> <Up>	 <Esc>gk
		inoremap <buffer> <silent> <Down> <Esc>gj
		inoremap <buffer> <silent> <Home> <C-o>g<Home>
		inoremap <buffer> <silent> <End>  <C-o>g<End>
		if a:show
			echom "Wrap ON"
		endif
	endif
endfunction

noremap <silent> <Leader>w :call ToggleWrap(1)<CR>
"call ToggleWrap(0)
"call ToggleWrap(0)

set hlsearch

" ============= Mouse Options    ===============
set mouse=a

" =============     Vimdiff      ===============
set equalalways
"set columns=80
"if &diff
"	let &columns = ((&columns*2 > 172)? 172: &columns*2)
"else
"endif

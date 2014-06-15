	let mapleader=","						"Change the leader to comma

	" ================ Tabularize =====================
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>

	" ================  Toggle to previuse buffer  ========
    map <Leader><Leader> <C-^>

	" ===========  Copy/Paste Mapping ================
	noremap <leader>y "*y
	noremap <leader>yy "*Y
	noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>"
	map <C-V> "*p

	" "map up/down arrow keys to unimpaired commands
	" nmap <Up> [e
	" nmap <Down> ]e
	" vmap <Up> [egv
	" vmap <Down> ]egv
	"
	" "map left/right arrow keys to indendation
	" nmap <Left> <<
	" nmap <Right> >>
	" vmap <Left> <gv
	" vmap <Right> >gv

	" ==========  Identation helpers  =============
	vmap <TAB> >gv
	vmap <S-TAB> <gv


	nnoremap <Tab>h <C-w>h
	nnoremap <Tab>j <C-w>j
	nnoremap <Tab>l <C-w>l
	nnoremap <Tab>k <C-w>k
	
	" =========  Toggle spell checker ===========
	nmap <silent> <leader>s :set spell!<CR>

	" =========  Toggle list			 ===========
	nmap <leader>l :set list!<CR>

	" =========  Toggle Hard Wrapping ===========
	nmap <leader>\ :set fo+=ta<CR>
	nmap <leader>' :set fo-=ta<CR>

	" =========  Cursor Movement		 =========== 
	map <C-right> <ESC>:bn<CR>
	map <C-left> <ESC>:bp<CR>
	map <F3> <ESC>:NERDTreeToggle<CR>
	map <leader>q :Mm<CR><C-L>
	nmap <C-J> <C-D>
	nmap <C-K> <C-U>
	nmap <C-H> 0						"Control H will goto to begining of line
	nmap <C-L> $						"Control L will goto to the end of line

	inoremap jj <Esc><Esc>			"Writing jj would cause to change to Normal M.  
	inoremap jk <Esc><Esc>			"Writing jk would cause to change to Normal M.
	inoremap kj <Esc><Esc>			"Writing kj would cause to change to Normal M.

	"nmap <C-Up> <C-W>-
	"nmap <C-Down> <C-W>+
	nmap <C-Up> <PageUp>				"Control Up for page up
	nmap <C-Down> <PageDown>		"Control Down for rrow keys work in visual mode

	" Activating shif+cursor to act as normal
	nmap <S-Up> v<Up>
	nmap <S-Down> v<Down>
	nmap <S-Left> v<Left>
	nmap <S-Right> v<Right>
	vmap <S-Up> <Up>
	vmap <S-Down> <Down>
	vmap <S-Left> <Left>
	vmap <S-Right> <Right>
	
	" Using arrow keys in insert mode will change to normal mode.
	inoremap <buffer> <Up> k<Esc>k
	inoremap <buffer> <Down> j<Esc>j
	vnoremap <buffer> <Down> j<Esc>j
	nnoremap <buffer> <Down> j<Esc>j
	inoremap <Left> <Esc><Left>
	inoremap <Right> <Esc><Right>
	
	" ============= Toggle Highlight  ===========
	noremap <F4> :set hlsearch! hlsearch?<CR>


let mapleader=","				"Change the leader to comma
let maplocalleader = "\\"			"Change localleader to backslash

" ================ Tabularize =====================
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" ================  Buffer  ========
map <Leader><Leader> <C-^>
map <S-Right>		<ESC>:bn<CR>
map <S-Left>		<ESC>:bp<CR>

" ===========  Copy/Paste Mapping ================
noremap <leader>y "*y
noremap <leader>yy "*Y
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>"
map <C-V> "+p
map <C-C> "+y
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
nmap <silent>		<leader>s :set spell!<CR>

" =========  Toggle list			 ===========
nmap <leader>l		:set list!<CR>

" =========  Toggle Hard Wrapping ===========
nmap <leader>\		:set fo+=ta<CR>
nmap <leader>'		:set fo-=ta<CR>

" =========  Cursor Movement		 ===========
map <leader>q :Bdelete<CR> 

nmap <C-Q> :Bdelete<CR> nmap <C-J><C-D>

nmap <C-K> <C-U> nmap <C-H> 0
"Control H will goto to begining of line nmap <C-L>			$
"Control L will goto to the end of line

inoremap jj			<Esc><Esc>				"Writing jj would cause to change to Normal M.
inoremap jk			<Esc><Esc>				"Writing jk would cause to change to Normal M.
inoremap kj			<Esc><Esc>				"Writing kj would cause to change to Normal M.

"nmap <C-Up>		<C-W>-
"nmap <C-Down>		<C-W>+
nmap <C-Up>			<PageUp>					"Control Up for page up
nmap <C-Down>		<PageDown>				"Control Down for rrow keys work in visual mode

inoremap <C-Home>			<Esc>gg
inoremap <C-End>			<Esc>G<End>
inoremap <C-PageUp>		<Esc>gg
inoremap <C-PageDown>	<Esc>G<End>

nmap <C-Home>				gg
nmap <C-End>				G<End>
nmap <C-PageUp>			gg
nmap <C-PageDown>			G<End>
nmap <C-A>					<Home>
nmap <C-E>					<End>
vmap <C-A>					<Home>
vmap <C-E>					<End>

" Activating shif+cursor to act as normal
nmap <S-Up>					v<Up>
nmap <S-Down>				v<Down>
" nmap <S-Left>				v<Left>
" nmap <S-Right>				v<Right>
vmap <S-Up>					<Up>
vmap <S-Down>				<Down>
" vmap <S-Left>				<Left>
" vmap <S-Right>				<Right>

" ======== Using arrow keys in insert mode will change to normal mode. =====
imap <Up>					<Esc><UP>
imap <Down>					<Esc><Down>
"vnoremap <buffer>		<Down> j<Esc>j
"nnoremap <buffer>		<Down> j<Esc>j
inoremap <Left>			<Esc><Left><Left>
inoremap <Right>			<Esc><Right><Right>

" Moving current line
nnoremap <C-j>				:m .+1<CR>==
nnoremap <C-k>				:m .-2<CR>==
inoremap <C-j>				<Esc>:m .+1<CR>==gi
inoremap <C-k>				<Esc>:m .-2<CR>==gi
vnoremap <C-j>				:m '>+1<CR>gv=gv
vnoremap <C-k>				:m '<-2<CR>gv=gv

" boxes shortcuts
nmap ,mc						!!boxes -d shell -a hcvc<CR>
vmap ,mc						!boxes -d shell -a hcvc<CR>
nmap ,xc						!!boxes -d shell -a hcvc -r<CR>
vmap ,xc						!boxes -d shell -a hcvc -r<CR>

nmap qq						:qa<CR>

" ============= Function Keys Mappings ===========
set		pastetoggle=<F2>										"Toggle paste with F2
map		<F3>				<ESC>:NERDTreeToggle<CR>		"Toggle nerd tree  F3
noremap	<F4>				:set hlsearch! hlsearch?<CR>	"Toggle highlight  F4
noremap	<F5>				:set invlist<CR>					"Toggle highlight  F5

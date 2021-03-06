let mapleader=","				"Change the leader to comma
let maplocalleader = "\\"			"Change localleader to backslash

" ================ Tabularize =====================
nmap <Leader>a= :Tabularize /=<C
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" ================  Buffer  ========
map <Leader><Leader> <C-^>
map <S-Right>		<ESC>:bn<CR>
map <S-Left>		<ESC>:bp<CR>

" ===========  Copy/Paste Mapping ================

function Xcopy()
   " The writefile function needs a list so we need to split the visual
   " selection into a list
   let as = split(@*, "\n")
   " write to file to avoid problems sending several lines from vim to shell
   call writefile(as, "/tmp/vimclip")
   echo system("xclip -selection clipboard -in /tmp/vimclip")
   " Silently notify about what has been copied
   silent echo system("notify-send 'VIM COPIED TO CLIPBOARD' \"$(cat /tmp/vimclip)\" &>/dev/null")
   echo system("rm /tmp/vimclip")
   echom "Copied ". len(as). " lines to clipboard"
endfunction

noremap <leader>y "+y
noremap <leader>yy "+Y
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>"

" disabling paste in favor of visual block mode
" map <C-V> :-1r !xclip -o -sel clip<CR>
" imap <C-V> <ESC>:-1r !xclip -o -sel clip<CR>
" vmap <C-> c<ESC>:-1r !xclip -o -sel clip<CR>
" map <C-C> "+y

" <c-u> is called to clean range in visual mode
map <C-C> :<c-u>call Xcopy()<CR>
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

" =====  Get email from mutt aliases  =======
inoremap <C-A>		<esc>:set virtualedit=onemore<CR>l:let @a=substitute(system('~/.mutt/scripts/alias-manager.py --file=~/.mutt/alias.key -l'),"\n","","g")<CR>i<C-R>a<ESC>:set virtualedit=<CR>a


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

" Use ctrl+backspace for backward deletion
nmap <C-h>  <esc>vbd
inoremap <C-H>  <esc>vbdha


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

" Duplicate current line
nnoremap <C-d>          yyp
inoremap <C-d>          <ESC>yyp
vnoremap <C-d>          ygv<ESC>p

" boxes shortcuts
nmap ,mc						!!boxes -d shell -a hcvc<CR>
vmap ,mc						!boxes -d shell -a hcvc<CR>
nmap ,xc						!!boxes -d shell -a hcvc -r<CR>
vmap ,xc						!boxes -d shell -a hcvc -r<CR>

nnoremap qq						:cq<CR>
nnoremap QQ						:cq!<CR>
vnoremap qq						<ESC>:cq<CR>
vnoremap QQ						<ESC>:cq!<CR>
cnoremap q!                 cq!
cnoremap Q!                 cq!
" ====== Corrections for common mistakes  ======

command! W w
command! Q q
command! Wq wq

" help
" Map alt+h to see how do ctrl+V then alt+h you will get ^[h replace ^[ with <escape>
nmap <Esc>h <esc>:execute "e ".dotfilespath."/vim/vimhelp.md"<enter>
" Removed ctrl+h because of collision with ctrl+backspace
" nmap <c-h> <esc>:execute "e ".dotfilespath."/vim/vimhelp.md"<enter>

"save and close buffer"
nmap <c-q> <esc>:bd<cr>
nmap <c-w><c-w> <esc>:.call DelQuit()<cr>
imap <c-w><c-w> <esc>:.call DelQuit()<cr>

"vim sudo trick
nnoremap <c-o> <esc>:w !sudo tee % <cr>
cmap w!! w !sudo tee > /dev/null %

"run current file
nnoremap <leader>r   :!%:p<cr>
xmap     <leader>r   :!%:p<cr>

"reload current file (todo: this was a bad binding because it blocked register
"paste so I removed it for now)
" map      <c-r>       :e<cr>
" map      <c-s-r>     :e!<cr>
" imap     <c-r> <esc> :e<cr>

"Search and replace with
" Use * to highligh all the words then press <c-n> then type
" the new word and press enter
nnoremap <c-n>       :%s///g<left><left>

" After selecting the text in visual mode, use // to search the whole document
" for it
" You can leverage from <C-N> for replacing the selected text
vnoremap // y/<C-R>"<CR>

" /q will unselect/unhighlight what ever you have selected or searched for
noremap /q :let @/ = ""<CR>

" Save current file there might be some overlaps with vim-sorround
nmap  <c-s> <esc>:w<cr>
imap  <c-s> <esc>:w<cr>

" ╔═════════════════════════════════════════════════════════════╗
" ║                                                             ║
" ║           Toggle vertical/horizontal orientation            ║
" ║                                                             ║
" ╚═════════════════════════════════════════════════════════════╝
" #tvh
nnoremap <silent> <c-w><s-Right> <c-w>L
nnoremap <silent> <c-w><s-Left> <c-w>H
nnoremap <silent> <c-w><s-Up> <c-w>K
nnoremap <silent> <c-w><s-Down> <c-w>J
nnoremap <silent> <c-e><c-e> :set lz<CR>:silent call ZoomWin#ZoomWin()<CR> 

" ╔═════════════════════════════════════════════════════════════╗
" ║                                                             ║
" ║               function keys keyboard bindings               ║
" ║                                                             ║
" ╚═════════════════════════════════════════════════════════════╝
" #fkb
map      <F1>           <esc>:execute "e ".dotfilespath."/help.md"<cr>
"Toggle paste with F2
set      pastetoggle=<F2>
"Toggle nerd tree  F3
map      <F3>           <ESC>:NERDTreeToggle<CR>
"Toggle highlight  F4
noremap  <F4>           :set hlsearch! hlsearch?<CR>
"Save and run current file
map      <c-F5>         <esc>:w<cr>:!%:p<cr>
"Toggle highlight  F5
noremap  <F5>           <esc>:set invlist<CR>
nmap     <F6>           <esc>:set invnumber<cr>
nmap     <F7>           <esc>:UndotreeToggle<cr>
"Toggle wrap
nmap     <F8>           <esc>:call ToggleWrap(1)<c-r>
"Show all keybindings
map      <F9>           <ESC>:call ExportMap()<cr><cr>
"Trim all whitespaces
nnoremap <F10>          <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>
map <leader>x <ESC>@:

" Use Silent to fix redraw problem when calling external program
command! -nargs=+ Silent execute 'silent <args>' |:redraw!

" Map ctrl+l to markdown previewer 
nmap  <silent> <c-l> <esc>:Silent !bat %&& read -q "REPLY?Press any key to continue ..." <cr>

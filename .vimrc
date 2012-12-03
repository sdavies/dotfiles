call pathogen#infect()
syntax on
filetype plugin indent on
Helptags
set guifont=Liberation\ Mono\ 12
set nowrap
set visualbell
set tabstop=4
set shiftwidth=4
set ignorecase
set noexpandtab
set hlsearch
set nocp
set t_Co=256
set bdir=~/tmp,~/,.
set dir=~/tmp,/tmp,/var/tmp/,~/,.
filetype plugin indent on
source ~/.vim/db
set spell spelllang=en_us
set nospell
set autowrite
set background=dark
if has ("gui_running")
	colorscheme solarized
	"colorscheme mustang
	"colorscheme adaryn
	"colorscheme 256adaryn
else
	set background=dark
	colorscheme ir_black
	"colorscheme solarized
	"colorscheme mustang
	"colorscheme adaryn
	"colorscheme 256adaryn
endif

if has("unix")
	nmap __xr   :r $HOME/.vimxfer<CR>
	nmap __xw   :'a,.w! $HOME/.vimxfer<CR>
	vmap __xr   c<esc>:r $HOME/.vimxfer<CR>
	vmap __xw   :w! $HOME/.vimxfer<CR>
else
	nmap __xr   :r c:/.vimxfer<CR>
	nmap __xw   :'a,.w! c:/.vimxfer<CR>
	vmap __xr   c<esc>:r c:/.vimxfer<cr>
	vmap __xw   :w! c:/.vimxfer<CR>
endif
vmap __psql <Esc>:'<,'><<<<<CR>:'<,'>s/^\(.*\)$/\t$sql .= " \1 ";/<CR>/$sql<CR>
vmap __sql <Esc>:'<,'>s/^.*= "//<CR>:'<,'>s/".*$//<CR>:SQLUFormatStmts<CR>/SELECT\\|INSERT\\|UPDATE\\|DELETE<CR>
vmap __get di<?php print gettext('<Esc>pa');?><Esc>
nmap __gf <Esc>:tabe %:p:h/<C-R><C-F>.php<CR>
nmap __<F8> <Esc>:NERDTreeToggle<CR>

" clean formatting for css
map <F9> :%s/\n\+\s*//g<CR>:%s/:[ ]*/:/g<CR>:%s/}/}\r\r/g<CR>:%s/;/;\r\t/g<CR>:%s/[ ]*{/ {\r\t/g<CR>:%s/\(\t\)\?\/\*\(.*\)\*\//\1\/\*\r\1\2\r\1\*\/\r\1/ge<CR>:%s/\(\t\)\?\/\*/\1\/\*\r\1/ge<CR>:%s/\(\n\+\)\?\(\t\)\?\*\//\r\2\*\/\r\2\1\2/ge<CR>:%s/^\t}/}/g<CR>:%s/\t\([^:]\+\):/\t\1: /g<CR>:%s/[ ]*!important/ !important/ge<CR>:%s/\t\n//ge<CR>:%s/\n\{3,\}/\r\r/ge<CR>:%s/\(\n^$\)\{2,\}//ge<CR>:let err=0<CR>:while err == 0<CR>try<CR> %s/^\([^,\t]\+\),\([^$ ]\)/\1,\r\2/g<CR>catch /^Vim\%((\a\+)\)\=:E/<CR>endtry<CR>:endwhile<CR>

function! Preserve(command)
	"Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	"Do the business:
	execute a:command
	"Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

function! KillWhitey()
	"Double blank lines
	"call Preserve("%s/\n\{3,}/\r\r/e %s/\\s\\+$//e")
	"Whitespace
	call Preserve("%s/\\s\\+$//e")
endfunction

function! IndentFile()
	call Preserve("normal gg=G")
endfunction

nmap __$ :call KillWhitey()<CR>
nmap __= :call IndentFile()<CR>

autocmd BufWritePre * :call KillWhitey()

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Logging
"set verbose=12
"set verbosefile=~/vim.log

" Show tree navigation rather than flat
let g:netrw_liststyle = 3
" Ctrl-O open netrw (file navigation)
map <C-o> :Explore<cr>

"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"	autocmd!
"	autocmd VimEnter * :Vexplore
"augroup END
"
"" Toggle Vexplore with Ctrl-E
"function! ToggleVExplorer(dir)
"	echom "bufnr(%) = ".bufnr("%")
"	echom "bufwinnr(NetrwTreeListing 1) = ".bufwinnr("NetrwTreeListing 1")
"	echom "bufname(bufnr(%)) = ".bufname(bufnr("%"))
"	if exists("t:expl_buf_num")
"		echom "Existing window ".t:expl_buf_num
"		let expl_win_num = bufwinnr(t:expl_buf_num)
"		echom "expl_win_num = ".expl_win_num
"		if expl_win_num != -1
"			let cur_win_nr = winnr()
"			echom "cur_win_nr = ".cur_win_nr
"			exec expl_win_num . 'wincmd w'
"			close
"			"exec cur_win_nr . 'wincmd w'
"		endif
"		unlet t:expl_buf_num
"	else
"		echom "No existing window"
"		if !exists("t:expl_path")
"			echom "Creating t:expl_path"
"			let t:expl_path = substitute(exists("b:netrw_curdir")? b:netrw_curdir : expand("%:p"), '^\(.*[/\\]\)[^/\\]*$','\1','e')
"		endif
"		exec '1wincmd w'
"		"if a:dir != ""
"		"	exec "Vexplore ".a.dir
"		"else
"			exec "Vexplore ".t:expl_path
"		"endif
"		let t:expl_buf_num = bufnr("%")
"		echom "t:expl_path = ".t:expl_path
"		echom "t:expl_buf_num = ".t:expl_buf_num
"		echom "bufname(t:expl_buf_num) = ".bufname(t:expl_buf_num)
"	endif
"endfunction
"map <silent> <C-o> :call ToggleVExplorer("")<CR>

"com!  -nargs=* -bar -bang -complete=dir  Lexplore  call netrw#Lexplore(<q-args>, <bang>0)

"fun! Lexplore(dir, right)
"	if exists("t:netrw_lexbufnr")
"		" close down netrw explorer window
"		let lexwinnr = bufwinnr(t:netrw_lexbufnr)
"		if lexwinnr != -1
"			let curwin = winnr()
"			exe lexwinnr."wincmd w"
"			close
"			exe curwin."wincmd w"
"		endif
"		unlet t:netrw_lexbufnr
"
"	else
"		" open netrw explorer window in the dir of current file
"		" (even on remote files)
"		let path = substitute(exists("b:netrw_curdir")? b:netrw_curdir : expand("%:p"), '^\(.*[/\\]\)[^/\\]*$','\1','e')
"		exe (a:right? "botright" : "topleft")." vertical ".((g:netrw_winsize > 0)? (g:netrw_winsize*winwidth(0))/100 : -g:netrw_winsize) . " new"
"		if a:dir != ""
"			exe "Explore ".a:dir
"		else
"			exe "Explore ".path
"		endif
"		setlocal winfixwidth
"		let t:netrw_lexbufnr = bufnr("%")
"	endif
"endfun

" Store swap and backup files somewhere safe
set backupdir=~/.vim/tmp/                   " for the backup files
set directory=~/.vim/tmp/                   " for the swap files

" Autocompletion for commands(?)
set wildmenu
set wildmode=list:longest,full

" Show partial commands in the last line of the screen
set showcmd

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" LSC language server plugin
let g:lsc_server_commands = {
			\ 'javascript': 'javascript-typescript-stdio',
			\ 'typescript': 'javascript-typescript-stdio',
			\ 'javascript.jsx': 'javascript-typescript-stdio',
			\ 'css': 'css-languageserver --stdio',
			\ 'scss': 'css-languageserver --stdio',
			\ 'less': 'css-languageserver --stdio',
			\ 'go': 'go-langserver -format-tool goimports -gocodecompletion -maxparallelism 4',
			\ 'python' : 'python3 /home/ubuntu/.local/bin/pyls',
			\}
"			\ 'go': 'bingo',
"			\ 'go': 'golsp --logfile auto',
"let g:lsc_auto_map = v:true " Use defaults
"" ... or set only the keys you want mapped, defaults are:
"let g:lsc_auto_map = {
"    \ 'GoToDefinition': '<C-]>',
"    \ 'FindReferences': 'gr',
"    \ 'NextReference': '<C-n>',
"    \ 'PreviousReference': '<C-p>',
"    \ 'FindImplementations': 'gI',
"    \ 'FindCodeActions': 'ga',
"    \ 'DocumentSymbol': 'go',
"    \ 'WorkspaceSymbol': 'gS',
"    \ 'ShowHover': 'K',
"    \ 'Completion': 'completefunc',
"    \}

" SuperTab to scroll from top instead of bottom
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabClosePreviewOnPopupClose = 1

" Vim completion popup menu
" http://vim.wikia.com/wiki/Improve_completion_popup_menu
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt-=preview
"set completeopt=longest,menuone
"set omnifunc=syntaxcomplete#Complete

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Automatically indent the next line
set autoindent

" For editing crontab
au FileType crontab setlocal bkc=yes

" Set the color scheme
set termguicolors
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"let g:solarized_termcolors=16
set background=dark
colorscheme solarized8
let &colorcolumn="80,".join(range(140,999),",")
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" filetype settings
filetype plugin on
filetype plugin indent on
let g:sql_type_default = 'pgsql'

if exists('g:loaded_polyglot')
	let g:polyglot_disabled = ['go']
endif
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

" ALE plugin
let g:ale_linters = { 'javascript': [ 'eslint' ], 'typescript': [ 'tslint' ]  }

" ALE key mappings
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" Enable syntax highlighting
syntax on

" Set tab stop to 4 characters/spaces
set tabstop=4
set shiftwidth=4

" Set tab stop for ruby
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" SUPPOSED to automatically read files when they've changed
set autoread

" Load tags file(s)
"set tags=.git/tags,./tags,./.tags

" Search as you type
set incsearch

" Highlight search results throughout file
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Always display the status line, even if only one window is displayed
set laststatus=2

" Set lightline color scheme
let g:lightline = { 'colorscheme': 'solarized' }

" Display line numbers on the left
set number

" Show trailing spaces and all tabs
set list
"set listchars=tab:▸\ ,eol:¬,trail:\
set listchars=tab:▸\ ,trail:·
"highlight SpecialKey ctermfg=Red cterm=NONE
highlight SpecialKey cterm=NONE ctermfg=224 gui=NONE guifg=#cb4b16 ctermbg=NONE guibg=NONE

" Go (vim-go)
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
""let g:go_fmt_command = "/root/go/src/golang.org/x/tools/cmd/goimports/goimports"
"let g:go_fmt_command = "goimports"

" dbext settings
let g:dbext_default_buffer_lines = 20
let g:dbext_default_type = 'PGSQL'
let g:dbext_default_user = 'postgres'
let g:dbext_default_history_file = '~/.dbext_sql_history'
let g:dbext_default_history_size = 250
let g:dbext_default_display_cmd_line = 1

if filereadable(glob("~/.vim/vimrc.dbext"))
	source ~/.vim/vimrc.dbext
endif

" dbext key mappings
"nnoremap <C-C> :DBPromptForBufferParameters<cr>
"nnoremap <C-E> :DBExecSQLUnderCursor<cr>
"inoremap <C-E> <C-\><C-O>:DBExecSQLUnderCursor<cr>
"map <F5> <Plug>DBExecSQLUnderCursor

" Tab handling via Taboo
let g:taboo_tab_format="  %N:%f  "
let g:taboo_renamed_tab_format="  %N:%l  "

function! TabRename()
	call inputsave()
	let name = input('Tab name: ')
	call inputrestore()
	execute ':TabooRename ' . name
endfunction

" Tab(oo) key mappings
nnoremap tk :tabfirst<cr>
nnoremap tl :tabnext<cr>
nnoremap th :tabprev<cr>
nnoremap tj :tablast<cr>
nnoremap tq :tabclose<cr>
nnoremap tc :tabnew<cr>
nnoremap t, :call TabRename()<cr>

nnoremap t1 1gt
nnoremap t2 2gt
nnoremap t3 3gt
nnoremap t4 4gt
nnoremap t5 5gt
nnoremap t6 6gt
nnoremap t7 7gt
nnoremap t8 8gt
nnoremap t9 9gt

" Window key mappings
"map <Tab> <C-W>w
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l
"map <C-;> <C-w>;
nnoremap <C-w>- :split<cr>
nnoremap <C-w>\| :vsplit<cr>

" Window scrolling
noremap <C-h> zH
noremap <C-l> zL

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>


"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l


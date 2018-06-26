" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Logging
"set verbose=12
"set verbosefile=~/vim.log

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
			\ 'css': 'vscode-css-languageserver-bin --stdio',
			\ 'scss': 'vscode-css-languageserver-bin --stdio',
			\ 'less': 'vscode-css-languageserver-bin --stdio',
			\ 'go': 'go-langserver',
			\}
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

" Vim completion popup menu
" http://vim.wikia.com/wiki/Improve_completion_popup_menu
set completeopt-=preview
set completeopt=longest,menuone

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Automatically indent the next line
set autoindent

" For editing crontab
au FileType crontab setlocal bkc=yes

" Set the color scheme
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
"let g:solarized_termcolors=16
set background=dark
colorscheme solarized

" filetype settings
filetype plugin on
filetype plugin indent on
let g:sql_type_default = 'pgsql'

" ALE plugin
let g:ale_linters = { 'javascript': [ 'eslint' ] }

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
highlight SpecialKey ctermfg=Red cterm=NONE

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
map <Tab> <C-W>w
map <C-j> <C-w>j
map <C-k> <C-w>k

" Window scrolling
map <C-h> zH
map <C-l> zL

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


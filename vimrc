"set verbose=12
"set verbosefile=~/vim.log

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

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

let g:SuperTabDefaultCompletionType = "<c-n>"

"set completeopt-=preview
set completeopt=longest,menuone

" Set the colors
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
"let g:solarized_termcolors=16
set background=dark
colorscheme solarized

" filetype settings
filetype plugin on
filetype plugin indent on
let g:sql_type_default = 'pgsql'

let g:ale_linters = { 'javascript': [ 'eslint' ] }

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" Absolute defaults
" Enable syntax highlighting
syntax enable
" Set tab stop to 4 characters/spaces
set tabstop=4
set shiftwidth=4

autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

set autoread

set tags=.git/tags,./tags,./.tags

" search settings
set incsearch
set hlsearch
set ignorecase
set smartcase

" Status line settings
set number
set ruler
"set statusline=%F\ %l\:%c\ 
"set laststatus=2
"set statusline+=%{&modified ? 'modified':''}

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"let g:go_fmt_command = "/root/go/src/golang.org/x/tools/cmd/goimports/goimports"
let g:go_fmt_command = "goimports"

" Typescript
if !exists("g:ycm_semantic_triggers")
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

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

" Window key mappings
map <Tab> <C-W>w
map <C-j> <C-w>j
map <C-k> <C-w>k
" window scrolling
map <C-h> zH
map <C-l> zL

" tag stacking
"noremap <C-[> :pop<cr>

" Show trailing spaces and all tabs
set list
"set listchars=tab:▸\ ,eol:¬,trail:\ 
set listchars=tab:▸\ ,trail:·
highlight SpecialKey ctermfg=Red cterm=NONE

" Allow backspace to remove auto-indentation, end of line
set backspace=indent,eol,start

" For editing crontab
au FileType crontab setlocal bkc=yes

"let g:ycm_global_ycm_extra_conf = ".vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

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

" Tab handling
let g:taboo_tab_format="  %N:%f  "
let g:taboo_renamed_tab_format="  %N:%l  "

function! TabRename()
	call inputsave()
	let name = input('Tab name: ')
	call inputrestore()
	execute ':TabooRename ' . name
endfunction

"noremap <C-t> <NOP>
"vnoremap <C-t> <NOP>
"inoremap <C-t> <NOP>
"map <C-t>, :call TabRename()<cr>
"map <C-t>c :tabnew<cr>
"map <C-t>l gt
"map <C-t>h gT
"map <C-t>1 1gt
"map <C-t>2 2gt
"map <C-t>3 3gt
"map <C-t>4 4gt
"map <C-t>5 5gt
"map <C-t>6 6gt
"map <C-t>7 7gt
"map <C-t>8 8gt
"map <C-t>9 9gt

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

"nnoremap <C-C> :DBPromptForBufferParameters<cr>
"nnoremap <C-E> :DBExecSQLUnderCursor<cr>
"inoremap <C-E> <C-\><C-O>:DBExecSQLUnderCursor<cr>
"map <F5> <Plug>DBExecSQLUnderCursor

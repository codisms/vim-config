set nocompatible
filetype plugin indent on

if filereadable(glob("~/.vim/vimrc.dbext"))
	source ~/.vim/vimrc.dbext
endif

"packadd minpac
"call minpac#init()

""" FZF """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-p> :<C-u>FZF<cr>  " open fzf
" C-j, C-h to navigate
" C-x, C-v, C-t to open in horizontal split, vertical split, or new tab
" C-c quit
"export FZF_DEFAULT_COMMAND='rg --files'
"
""" ALE
let g:ale_linters = {  'javascript': ['eslint']  }

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

""" vim-test
let test#strategy = "dispatch"

""" LanguageClient-neovim
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'py': ['pyls'],
    \ 'go': ['~/go/bin/go-langserver']
    \ }
" docker-langserver --stdio / docker-langserver --socket=<port>
" pyls --tcp --port

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


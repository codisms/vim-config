# vim-config

## Installation
```
curl -sSL https://github.com/codisms/vim-config/raw/master/install.sh | bash -s -- \
  [--build] [--version=<version>]
```

### Windows installation
On Windows, make sure to execute the following before installation:
```
git config --global core.autocrlf input
```

## Notable Options
* Uses solarized coloring
* Tabstop = 4
* Line numbers and leading space markers visible
* Go fmt command set to goimports
* dbext set to PGSQL by default

## Plugins
* fzf
* vim-dispatch
* dbext
* taboo
* ale
* vim-lsc
* lightline.vim
* vim-polyglot
* vim-editorconfig
* vim-go
* typescript-vim
* vim-abolish
* solarized8
* vim-javascript
* VimCompletesMe

## Key Mappings
* Leader is changed to \<space\>.
* _All arrows keys disabled_ (purist)

### Command Mappings
* tk = first tab
* tl = next tab
* th = previous tab
* tj = last tab
* tq = close tab
* tc = new tab
* t, = rename tab
* t# = goto tab #

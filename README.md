# vim-config

## Installation
```
cd ~
git clone https://github.com/codisms/vim-config.git .vim
cd .vim
git submodule init
cd ..
ln -s .vim/vimrc .vimrc
```

## Notable Options
* Pathogen
* Uses solarized coloring
* Tabstop = 4
* Line numbers and leading space markers visible
* Go fmt command set to goimports
* dbext set to PGSQL by default

## Key Mappings
* Ctrl-h = scroll window left
* Ctrl-l = scroll window right
* Tab = Switch windows
* All arrows keys disabled (purist)

## Command Mappings
* tk = first tab
* tl = next tab
* th = previous tab
* tj = last tab
* tq = close tab
* tc = new tab
* t, = rename tab
* t# = goto tab #


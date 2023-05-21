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

- Uses solarized coloring
- Tabstop = 4
- Line numbers and leading space markers visible
- Go fmt command set to goimports
- dbext set to PGSQL by default

## Plugins

- dbext
- lightline.vim
- vim-polyglot
- vim-editorconfig
- vim-abolish
- solarized8
- coc
  - coc-angular
  - coc-css
  - coc-docker
  - coc-eslint
  - coc-go
  - coc-html
  - coc-java
  - coc-json
  - coc-prettier
  - coc-pylsp
  - coc-sql

## Key Mappings

- Leader is changed to \<space\>.
- _All arrows keys disabled_ (purist)

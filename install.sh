#!/bin/bash

cd ~/.vim
git submodule init
git submodule update --init --recursive

echo "Installing ripgrep..."
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb /tmp/ripgrep_0.8.1_amd64.deb
sudo dpkg -i /tmp/ripgrep_0.8.1_amd64.deb
~/.vim/pack/bundle/start/fzf/install --bin
export FZF_DEFAULT_COMMAND='rg --files'
echo "export FZF_DEFAULT_COMMAND='rg --files'" >> ~/.profile

echo "Installing language services..."
cd ~/.vim/pack/bundle/start/LanguageClient-neovim
./install.sh
npm i -g bash-language-server 
#npm i -g dockerfile-language-server-nodejs 
pip install python-language-server

cd ~/go
go get -u github.com/sourcegraph/go-langserver

cd ~/.vim

echo "Updating documentation..."
vim -c "helptags ALL" -c q

#!/bin/bash

if [ ! -d ~/.vim/pack/bundle/start ]; then
	mkdir -p ~/.vim/pack/bundle/start
fi
cd ~/.vim/pack/bundle/start

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i ripgrep_0.8.1_amd64.deb
git clone https://github.com/junegunn/fzf
fzf/install --bin
export FZF_DEFAULT_COMMAND='rg --files'
echo "export FZF_DEFAULT_COMMAND='rg --files'" >> ~/.profile

git clone --depth 1 https://github.com/tpope/vim-projectionist.git

git clone --depth 1 https://github.com/tpope/vim-dispatch.git

git clone --depth 1 https://github.com/w0rp/ale.git

git clone --depth 1 https://github.com/janko-m/vim-test.git

git clone --depth 1 https://github.com/sgur/vim-editorconfig

git clone --depth 1 https://github.com/autozimu/LanguageClient-neovim.git
cd LanguageClient-neovim
./install.sh
npm i -g bash-language-server 
#npm i -g dockerfile-language-server-nodejs 
pip install python-language-server

cd ~/go
go get -u github.com/sourcegraph/go-langserver

vim -c "helptags ALL" -c q

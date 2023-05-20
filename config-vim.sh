#!/bin/bash

#set -e
#set -x

cd `dirname $0`
source ./functions

BUILD=$(option_set build)
debug "BUILD = ${BUILD}"

configureVim() {
	#echo -e "\e[36mConfiguring vim...\e[0m"
	cd "${HOME}"

	echo -e "\e[35mDownloading vim configuration to $(pwd)...\e[0m"
	if [ -d .vim ]; then
		cd .vim
		git pull
	else
		git clone https://github.com/codisms/vim-config.git .vim
		cd .vim
	fi

	if [ ! -f ${HOME}/.vim/vimrc ]; then
		#echo -e "\e[35mConfiguring vim...\e[0m"
		ln -s ${HOME}/.vim/vimrc ${HOME}/.vimrc
	fi

	echo -e "\e[35mDownloading submodules...\e[0m"
	#if [ -d pack ]; then
	#	if [ -d pack.bak ]; then
	#		rm -rf pack.bak
	#	fi
	#	mv pack pack.bak
	#fi
	#if [ -d repo ]; then
	#	if [ -d repo.bak ]; then
	#		rm -rf repo.bak
	#	fi
	#	mv repo repo.bak
	#fi
	git submodule update --init --recursive --remote
	git submodule update --recursive --remote --merge
	cd ..
}

installVimExtensions() {
	echo -e "\e[36mInstalling vim extensions\e[0m"

	echo -e "\e[35mInstalling vim-polyglot...\e[0m"
	if [ -f ${HOME}/.vim/pack/bundle/start/vim-polyglot/build ]; then
		cd ${HOME}/.vim/pack/bundle/start/vim-polyglot
		./build
		cd ${HOME}/.vim
	fi
	if [ -f ${HOME}/.vim/pack/bundle/start/vim-polyglot/Makefile ]; then
		cd ${HOME}/.vim/pack/bundle/start/vim-polyglot
		make
		cd ${HOME}/.vim
	fi

	npm install -g prettier

	echo -e "\e[35mInstalling coc extensions...\e[0m"
	mkdir -p ~/.config/coc/extensions
	cd ~/.config/coc/extensions
	if [ ! -f package.json ]; then
		echo '{"dependencies":{}}'> package.json
	fi
	npm install --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod \
		coc-angular coc-css coc-docker coc-eslint coc-go coc-html coc-java coc-json coc-prettier \
		@yaegassy/coc-pylsp coc-sql coc-tsserver
}

if [ ${BUILD} -eq 1 ]; then
	${HOME}/.vim/build-vim.sh $@
fi

configureVim
installVimExtensions

echo -e "\e[36mDone configuring vim\e[0m"

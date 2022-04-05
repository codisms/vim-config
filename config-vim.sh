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

installVimExtensions_YCM() {
	echo -e "\e[35mInstalling YouCompleteMe...\e[0m"

	cd ${HOME}/.vim/pack/bundle/start/YouCompleteMe
	#./install.py echo "~~~ PATH = ${PATH}"

	# https://unix.stackexchange.com/a/233287 FREE_MEMORY=$(free | awk -v RS="" '{ print $10 / 1024; }'
	#| bc)
	FREE_MEMORY=$(cat /proc/meminfo | grep -e '\(Swap\|Mem\)Free' | awk -v RS="" '{ print $2 + $5; }' |
bc)
	echo FREE_MEMORY = ${FREE_MEMORY}
	if [ $FREE_MEMORY -lt 1048576 ]; then
		echo -e "\e[31;5mUsing low-memory compilation options\e[0m"
		# We're going to assume a large enough swap has been specified

		YCM_CORES=1 ./install.py --clang-completer --gocode-completer --tern-completer
	else
		echo "Using normal compilation options"
		./install.py --clang-completer --gocode-completer --tern-completer
	fi

	#./install.py --clang-completer --system-libclang --gocode-completer > /dev/null
}

installVimExtensions_FZF() {
	echo -e "\e[35mInstalling fzf...\e[0m"

	${HOME}/.vim/pack/bundle/start/fzf/install --bin
	if ! grep -q fzf ${HOME}/.profile; then
		echo "export PATH=\$PATH:${HOME}/.vim/pack/bundle/start/fzf/bin" >> ${HOME}/.profile
	fi
}

installVimExtensions_LangServ() {
	echo -e "\e[35mInstalling Javascript/Typescript language server...\e[0m"
	npm install -g javascript-typescript-langserver

	echo -e "\e[35mInstalling CSS/LESS/SASS language server...\e[0m"
	npm install -g vscode-css-languageserver-bin

	echo -e "\e[35mInstalling Go language server...\e[0m"
	go install github.com/sourcegraph/go-langserver@latest

	echo -e "\e[35mInstalling Python language server...\e[0m"
	pip3 install 'python-language-server[all]'
}

installVimExtensions() {
	echo -e "\e[36mInstalling vim extensions\e[0m"

	#installVimExtensions_YCM
	installVimExtensions_FZF
	installVimExtensions_LangServ

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
}

if [ ${BUILD} -eq 1 ]; then
	${HOME}/.vim/build-vim.sh $@
fi

configureVim
installVimExtensions

echo -e "\e[36mDone configuring vim\e[0m"

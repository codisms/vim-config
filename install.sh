#!/bin/bash

if [ ! -d ${HOME}/.vim ]; then
	echo -e "\e[35mDownloading vim configuration for the first time...\e[0m"
	git clone https://github.com/codisms/vim-config.git ${HOME}/.vim
fi

${HOME}/.vim/config-vim.sh $@


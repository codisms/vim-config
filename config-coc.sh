#!/bin/bash

#set -e
#set -x

#cd `dirname $0`
#source ./functions

rm -rf ~/.config/coc/extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]; then
	echo '{"dependencies":{}}'> package.json
fi
npm install --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod \
	coc-angular coc-css coc-docker coc-eslint coc-go coc-html coc-json coc-prettier \
	@yaegassy/coc-pylsp coc-sql coc-tsserver
# coc-java

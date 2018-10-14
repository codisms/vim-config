#!/bin/bash

cd `dirname $0`
SCRIPTPATH=`pwd`
source "${SCRIPTPATH}/functions"

VERSION=$(option_value version)
PACKAGE_MANAGER=$(get_package_manager)

if [ "${VERSION}" == "" ]; then
	echo "Querying latest version of vim..."
	VERSION=$(curl -H 'Accept: application/vnd.github.v3+json' https://api.github.com/repos/vim/vim/tags -s | json "[0].name")
fi

echo -e "\e[36mBuilding vim ${VERSION}...\e[0m"

cd /tmp
if [ -d vim ]; then
	rm -rf vim
fi

echo -e "\e[35mCloning vim...\e[0m"
if [ "${VERSION}" == "" ]; then
	git clone --depth=1 https://github.com/vim/vim.git
else
	git clone --depth=1 -b ${VERSION} https://github.com/vim/vim.git
fi

echo -e "\e[35mBuilding vim...\e[0m"
cd vim
echo "  - configure"
./configure --with-features=huge \
			--enable-terminal \
			--enable-multibyte \
			--enable-rubyinterp=dynamic \
			--enable-pythoninterp=dynamic \
			--enable-python3interp=dynamic \
			--enable-perlinterp=dynamic \
			--enable-luainterp=dynamic \
			--enable-gui=gtk2 \
			--enable-cscope \
			--prefix=/usr \
			--quiet > /dev/null
#			--with-python-config-dir=/usr/lib/python2.6/config \
echo "  - make"
make --quiet > /dev/null

echo -e "\e[35mRemoving existing version of vi/vim...\e[0m"

if [ $PACKAGE_MANAGER == "apt" ]; then
	$SUDO apt-get remove -y vim vim-common vim-tiny
fi
if [ $PACKAGE_MANAGER == "yum" ]; then
	#$SUDO yum -y remove vim-common vim-enhanced vim-minimal
	$SUDO yum -y remove vim-common vim-enhanced vim-tiny vim

	# Why am I doing this again?
	#if [ "$SUDO" != "" ] && [ "$(which sudo 2> /dev/null)" == "" ]; then
	#	echo Reinstalling sudo...
	#	$SUDO yum -y install sudo
	#	SUDO=$(which sudo 2> /dev/null)
	#fi
fi

echo -e "\e[35mInstalling binary...\e[0m"
$SUDO make install --quiet > /dev/null
cd ..
rm -rf vim

echo -e "\e[35mSetting vim as default...\e[0m"
$SUDO update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
$SUDO update-alternatives --set editor /usr/bin/vim
$SUDO update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
$SUDO update-alternatives --set vi /usr/bin/vim

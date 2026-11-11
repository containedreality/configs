#!/bin/sh
if [ "$USER" != 'root' ]; then
	exec sudo $0
fi

/opt/john/run/john

if [ -d '/opt/john' ] && [ -z "$IGNORE_INSTALLED" ]; then
	echo 'john is already installed, do you want to continue?'
	read -p '[y\N] ' prompt
	if [ -z "$prompt" ] || [ "$prompt" = 'n' ]; then
		exit 1
	fi
fi


sudo apt-get -y install git build-essential libssl-dev
sudo apt-get -y build-dep john

git clone --depth=1 https://github.com/openwall/john.git /opt/john
cd /opt/john/src
./configure || exit 1
make -s clean && make -sj$(nproc) && make install
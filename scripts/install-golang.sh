#!/bin/sh
if [ "$USER" != 'root' ]; then
	exec sudo $0
fi

if [ -d '/opt/go' ] && [ -z "$IGNORE_INSTALLED" ]; then
	echo 'go is already installed, do you want to continue?'
	read -p '[y\N] ' prompt
	if [ -z "$prompt" ] || [ "$prompt" = 'n' ]; then
		exit 1
	fi
fi

curl -Lo - 'https://go.dev/dl/go1.27.4.linux-amd64.tar.gz' | tar -zxf - -C /opt

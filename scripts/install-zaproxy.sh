#!/bin/sh
ZAPROXY='https://github.com/zaproxy/zaproxy/releases/download/v2.17.0/ZAP_2.17.0_Crossplatform.zip'
BASENAME=$(basename "$ZAPROXY")

if [ "$USER" != 'root' ]; then
	exec sudo $0
fi

apt-get install -y unzip openjdk-25-jdk

if [ -f "/opt/$BASENAME" ] && [ -z "$IGNORE_INSTALLED" ]; then
	echo 'zaproxy is already installed, do you want to continue?'
	read -p '[y\N] ' prompt
	if [ -z "$prompt" ] || [ "$prompt" = 'n' ]; then
		exit 1
	fi
fi

cd /opt
curl -Lo "$BASENAME" "$ZAPROXY" || exit 1
unzip "$BASENAME"
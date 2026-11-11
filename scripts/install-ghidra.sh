#!/bin/sh
GHIDRA_URL='https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_12.2_build/ghidra_12.2_PUBLIC_20261016.zip'
BASENAME=$(basename "$GHIDRA_URL")

if [ "$USER" != 'root' ]; then
	exec sudo $0
fi

apt-get install -y unzip openjdk-25-jdk

if [ -f "/opt/$BASENAME" ] && [ -z "$IGNORE_INSTALLED" ]; then
	echo 'ghidra is already installed, do you want to continue?'
	read -p '[y\N] ' prompt
	if [ -z "$prompt" ] || [ "$prompt" = 'n' ]; then
		exit 1
	fi
fi

cd /opt
curl -Lo "$BASENAME" "$GHIDRA_URL" || exit 1
unzip "$BASENAME"
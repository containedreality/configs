#!/bin/sh
if [ "$USER" != 'root' ]; then
	exec sudo $0
fi

git clone --depth=1 https://github.com/danielmiessler/SecLists.git /opt/seclists
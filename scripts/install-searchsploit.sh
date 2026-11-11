#!/bin/sh
if [ "$USER" != 'root' ]; then
	exec sudo $0
fi

git clone --depth=1 https://gitlab.com/exploit-database/exploitdb.git /opt/exploit-database
ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit

#!/bin/sh
if [ "$USER" != 'root' ]; then
	exec sudo $0
fi

# echo 'deb [signed-by=/etc/apt/keyrings/metasploit-framework.gpg] https://apt.metasploit.com/ sid main' > /etc/apt/sources.list.d/metasploit.list
curl -o /etc/apt/keyrings/metasploit-framework.gpg https://apt.metasploit.com/metasploit-framework.gpg.key
echo 'Types: deb' > /etc/apt/sources.list.d/metasploit.sources
echo 'URIs: https://apt.metasploit.com/' >> /etc/apt/sources.list.d/metasploit.sources
echo 'Suites: sid' >> /etc/apt/sources.list.d/metasploit.sources
echo 'Components: main' >> /etc/apt/sources.list.d/metasploit.sources
echo 'Signed-By: /etc/apt/keyrings/metasploit-framework.gpg' >> /etc/apt/sources.list.d/metasploit.sources

apt-get update && apt-get install -y metasploit-framework

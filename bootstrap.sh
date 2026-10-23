#!/bin/sh
if [ -z "${HOME}" ]; then
	echo "\$HOME is null"
	exit 1
fi

mkdir -p ${HOME}/.local/share
mkdir -p ${HOME}/.local/bin
mkdir -p ${HOME}/.config/VSCodium/User
cp -v vimrc ${HOME}/.vimrc
cp -v settings.json ${HOME}/.config/VSCodium/User

cp -v bashrc ${HOME}/.bashrc
cp -v gitconfig ${HOME}/.gitconfig
rm -f ${HOME}/.bash_profile
ln -s ${HOME}/.bashrc ${HOME}/.bash_profile

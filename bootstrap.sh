#!/bin/sh
REPO_ENCRYPT="https://github.com/containedreality/encrypt/releases/download/v1.0.0/"

if ! [ -x /usr/bin/curl ]; then
	sudo apt-get -y install curl
fi

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

if ! [ -x "${HOME}/.local/bin/encrypt" ]; then
	curl -Lo "${HOME}/.local/bin/encrypt" "${REPO_ENCRYPT}"/encrypt-linux-amd64
	chmod +x "${HOME}/.local/bin/encrypt"
fi

if ! [ -x "${HOME}/.local/bin/decrypt" ]; then
	curl -Lo "${HOME}/.local/bin/decrypt" "${REPO_ENCRYPT}"/decrypt-linux-amd64
	chmod +x "${HOME}/.local/bin/decrypt"
fi

if ! [ -x "${HOME}/.local/bin/digest" ]; then
	curl -Lo "${HOME}/.local/bin/digest" "${REPO_ENCRYPT}"/digest-linux-amd64
	chmod +x "${HOME}/.local/bin/digest"
fi

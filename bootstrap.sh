#!/bin/sh
REPO_ENCRYPT="https://github.com/containedreality/encrypt/releases/download/v1.0.0/"

if [ "$1" = 'install-software' ]; then
	sudo apt-get -y install extrepo
	extrepo enable vscodium
	sudo apt-get -y install curl keepassxc codium
	
	curl -Lo "${HOME}/.local/bin/encrypt" "${REPO_ENCRYPT}"/encrypt-linux-amd64
	chmod +x "${HOME}/.local/bin/encrypt"

	curl -Lo "${HOME}/.local/bin/decrypt" "${REPO_ENCRYPT}"/decrypt-linux-amd64
	chmod +x "${HOME}/.local/bin/decrypt"

	curl -Lo "${HOME}/.local/bin/digest" "${REPO_ENCRYPT}"/digest-linux-amd64
	chmod +x "${HOME}/.local/bin/digest"
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


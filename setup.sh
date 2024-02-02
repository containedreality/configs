#!/bin/sh
packages="jq fish xclip ruby nnn curl ctags vim git arch-wiki-docs man-db man-pages base-devel arch-install-scripts"

if [ "$1" = 'install-programs' ]; then
	sudo pacman -S $packages
	chsh -s $(which fish)
fi

mkdir -p ~/.config/fish
mkdir -p ~/.config/kitty
cp gitconfig ~/.gitconfig
cp kitty.conf ~/.config/kitty
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp config.fish ~/.config/fish/config.fish

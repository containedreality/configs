#!/bin/sh
packages="jq kakoune fish xclip ruby nnn curl ctags vim git arch-wiki-docs man-db man-pages base-devel arch-install-scripts"

if [ "$1" = 'install-programs' ]; then
	sudo pacman -S $packages
	chsh -s $(which fish)
fi

mkdir -p ~/.config/fish
mkdir -p ~/.config/kitty
mkdir -p ~/.config/kak/
cp gitconfig ~/.gitconfig
cp kitty.conf ~/.config/kitty
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp config.fish ~/.config/fish/config.fish
cp kakrc ~/.config/kak/kakrc

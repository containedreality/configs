#!/bin/sh
packages="kakoune fish xclip ruby-dev curl busybox git build-essential"

if [ "$1" = 'install-programs' ]; then
    sudo apt install -y $packages
fi

mkdir -p ~/.config/fish
mkdir -p ~/.config/kitty
mkdir -p ~/.config/kak/
cp gitconfig ~/.gitconfig
cp kitty.conf ~/.config/kitty
cp config.fish ~/.config/fish/config.fish
cp kakrc ~/.config/kak/kakrc

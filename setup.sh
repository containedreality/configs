#!/bin/sh
packages_arch="kakoune newsboat fish xclip ruby curl busybox base-devel kitty"
packages="kakoune newsboat fish xclip ruby-dev curl busybox-static git build-essential kitty"

if [ "$1" = 'install-programs' ]; then
    # I understand this is sort of a bad way to do this, a better way would be detecting package manager, but also I do not care.
    sudo pacman -S --noconfirm $packages_arch
    sudo apt install -y $packages
fi

mkdir -p ~/.config/fish
mkdir -p ~/.config/kitty
mkdir -p ~/.config/kak/
mkdir -p ~/.newsboat
cp newsfeed ~/.newsboat/urls
cp gitconfig ~/.gitconfig
cp kitty.conf ~/.config/kitty
cp config.fish ~/.config/fish/config.fish
cp kakrc ~/.config/kak/kakrc

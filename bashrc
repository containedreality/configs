#!/usr/bin/env bash
if [ -x /usr/bin/pfetch ]; then
	pfetch
fi

export HISTFILE="~/.config/bash_history"
export HISTFILESIZE="10000"
export PATH="/home/$USER/.local/bin:$PATH:/usr/lib/plan9/bin/"
export EDITOR=vim

shopt -s autocd

# functions
search-aur() {
	curl https://aur.archlinux.org/rpc/v5/search/"$1" | jq '{"results"}'
}

clone-aur() {
	pushd "$PWD"
	! [ -d ~/.local/src ] && mkdir -p ~/.local/src
	cd ~/.local/src && git clone https://aur.archlinux.org/"$1".git "$1"
	cd "$1"
}

clone-gitlab() {
	pushd "$PWD"
	! [ -d ~/.local/src ] && mkdir -p ~/.local/src
	cd ~/.local/src && git clone https://gitlab.archlinux.org/archlinux/packaging/packages/"$1".git "$1"
	cd "$1"
}

# aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias cb="xclip -sel clip"
alias q="exit"
alias s="sudo"
alias m="man"
alias ll="ls -alh"
alias la="ls -aC"
alias rm="rm -vrf"
alias paci="sudo pacman -S"
alias pacr="sudo pacman -R"
alias pacu="sudo pacman -Syu"
alias pacs="pacman -Ss"
alias pacf="pacman -Kx"
alias sc="systemctl"
alias ssc="sudo systemctl"
alias jc="journalctl"
alias sjc="sudo journalctl"
alias g="git"
alias gi="git init"
alias gp="git push"
alias gc="git commit"
alias gcl="git clone"
alias ga="git add"
alias gr="git rebase"
alias grr="git reset"
alias gl="git log"
alias gs="git status"
alias gd="git diff"
alias gb="git branch"

# prompt
PS1='\[\e[96m\]\u\[\e[0m\]@\h:\w\[\e[0m\] \\$ '

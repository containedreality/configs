#!/usr/bin/env bash
. /etc/profile

# keybinds
shopt -s dotglob
shopt -s autocd

# functions
append_path()
{
    case ":$PATH:" in
        *:"$1":*)
        ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

prepend_path()
{
    case ":$PATH:" in
        *:"$1":*)
        ;;
        *)
            PATH="$1:${PATH:+$PATH:}"
    esac
}

arc()
{
	tar -I'zstd -v -8 -T0' --xattrs -cf "$(basename "$1")-$(date +'%m%d%y')".tar.zst -C "$1" .
}

earc()
{
	tar -I'zstd -8 -T0' --xattrs -cf - -C "$1" . | openssl enc -pbkdf2 -iter 800000 -saltlen 16 -aes-256-ctr | tee "$(basename "$1")-$(date +'%m%d%y')".tar.zst.enc | openssl dgst -r -sha512
}

# more portable, ready for the distribution among the masses! (maybe)
parc()
{
	tar -I'gzip -v -4' --owner=0 --group=0 --xattrs -cf "$(basename "$1")-$(date +'%m%d%y')".tar.gz -C "$1" .
}

al()
{
	# $@ is used so we can use user parameters.
	case "$1" in
		*.7z)
			7z l $@
			;;
		*.enc)
			openssl enc -d -pbkdf2 -iter 800000 -aes-256-ctr -in "$1" | tar --zstd -tf -
			;;
		*.tar*)
			tar -vtf $@
			;;
		*.zip)
			unzip -v $@
			;;
		*.rar)
			unrar -t $@
			;;
	esac
}

ax()
{
	# $@ is used so we can use user parameters.
	case "$1" in
		*.7z)
			7z x $@
			;;
		*.enc)
			openssl enc -d -pbkdf2 -iter 800000 -saltlen 16 -aes-256-ctr -in "$1" | tar --xattrs --zstd -xf -
			;;
		*.tar*)
			tar --xattrs -xvf $@
			;;
		*.zip)
			unzip $@
			;;
		*.rar)
			unrar -x $@
			;;
	esac
}

# Persist path, if file exists.
if [ -r "/tmp/path-persist-$USER" ]; then
    cd $(cat "/tmp/path-persist-$USER")
fi
alias ppc="rm -vf /tmp/path-persist-$USER"
alias pp="pwd > /tmp/path-persist-$USER"

# environment
append_path "${HOME}/.local/bin"
append_path "${HOME}/go/bin"
append_path "/opt/go/bin"

for i in librewolf firefox chromium; do
	if command -v "$i" >/dev/null; then
		export BROWSER="$i"
		break
	fi

	export BROWSER="none"
done

for i in vim vi nano ed; do
	if command -v "$i" >/dev/null; then
		export EDITOR="$i"
		break
	fi
done

export HISTFILE="${HOME}/.cache/bash_history"
export HISTSIZE=100000
export SAVEHIST=1000
export PAGER="/usr/bin/less"

# shell and utils
alias q="exit"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias l="ls"
alias ll="ls -alh"
alias la="ls -aC"
alias ng="nekoget"
alias gpg="gpg --digest-algo SHA512 --cipher-algo AES256"

# apt
alias aptu="sudo apt update && sudo apt upgrade"
alias apti="sudo apt install"
alias aptr="sudo apt remove"
alias aptc="sudo apt clean && sudo apt autoremove"
alias apts="apt-cache search"

# git
alias g="git"
alias gi="git init"
alias gp="git push"
alias gpu="git pull"
alias gc="git commit"
alias gcl="git clone"
alias ga="git add"
alias gr="git rebase"
alias grr="git reset"
alias gl="git log"
alias gs="git status"
alias gd="git diff"
alias gb="git branch"
alias gss="git show"

# prompt
prompt() {
	branch=$(git branch --no-color 2>/dev/null | cut -d' ' -f2)
	changes=$(git status -s -uno 2>/dev/null | wc -l | sed 's/[[:space:]]//g')

	color='32m'

	if [ -z "${branch}" ]; then
		PS1="${VIRTUAL_ENV_PROMPT}\[\e[90m\][\[\e[${color}\]\u\[\e[0m\]@\h \W\[\e[90m\]]\[\e[0m\]\$ "
	else
		PS1="${VIRTUAL_ENV_PROMPT}[${branch}:${changes}] \[\e[90m\][\[\e[${color}\]\u\[\e[0m\]@\h \W\[\e[90m\]]\[\e[0m\]\$ "
	fi
}

PROMPT_COMMAND="prompt"

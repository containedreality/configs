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

# Persist path, if file exists.
if [ -r "/tmp/path-persist-$USER" ]; then
    cd $(cat "/tmp/path-persist-$USER")
fi
alias ppc="rm -vf /tmp/path-persist-$USER"
alias pp="pwd > /tmp/path-persist-$USER"

# environment
append_path "${HOME}/.local/bin"
append_path "${HOME}/go/bin"
append_path "/bin"
append_path "/sbin"
append_path "/usr/bin"
append_path "/usr/local/bin"
append_path "/usr/local/sbin"
append_path "/usr/sbin"

for i in librewolf firefox chromium; do
	if command -v "$i" >/dev/null; then
		export BROWSER="$i"
		break
	fi

	export BROWSER="none"
done

for i in vim vi nano kak ed; do
	if command -v "$i" >/dev/null; then
		export EDITOR="$i"
		break
	fi
done

if [ "$TERM" = 'xterm-kitty' ]; then
	# fixes SSH on external hosts.
	alias ssh='TERM=xterm-256color ssh'
fi

export HISTFILE="${HOME}/.cache/bash_history"
export HISTSIZE=100000
export SAVEHIST=1000
export PAGER="/usr/bin/less"

if [ -x '/usr/bin/sudo-rs' ]; then
	alias sudo='sudo-rs'
fi

alias q="exit"
alias ls="ls --color=auto"
alias l="ls"
alias ll="ls -alh"
alias la="ls -aC"
alias grep="grep --color=auto"

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

	color='35m'

	if [ -z "${branch}" ]; then
		PS1="${VIRTUAL_ENV_PROMPT}\[\e[90m\][\[\e[${color}\]\u\[\e[0m\]@\h \W\[\e[90m\]]\[\e[0m\]\$ "
	else
		PS1="${VIRTUAL_ENV_PROMPT}[${branch}:${changes}] \[\e[90m\][\[\e[${color}\]\u\[\e[0m\]@\h \W\[\e[90m\]]\[\e[0m\]\$ "
	fi
}

PROMPT_COMMAND="prompt"

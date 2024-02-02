if status is-interactive
	fish_add_path -aP "/usr/sbin"
	fish_add_path -aP "/usr/local/sbin"
	fish_add_path -aP "/sbin"

	for editor in "vim" "vi" "ed" "nano"
		if which $editor 2>/dev/null 1>&2
			set -x EDITOR "$editor"
			break
		end
	end
	abbr -a cb "xclip -sel clip"
	abbr -a q "exit"
	abbr -a s "sudo"
	abbr -a m "man"
	abbr -a ll "ls -alh"
	abbr -a la "ls -aC"

	abbr -a apti "sudo apt install --no-install-recommends"
	abbr -a aptr "sudo apt remove"
	abbr -a aptu "sudo apt update && sudo apt upgrade"
	abbr -a apts "apt-cache search"
	abbr -a aptc "sudo apt clean && sudo apt autoremove"
	abbr -a paci "sudo pacman -S"
	abbr -a pacr "sudo pacman -R"
	abbr -a pacu "sudo pacman -Syu"
	abbr -a pacs "pacman -Ss"
	abbr -a pacf "pacman -Kx"

	abbr -a sc "systemctl"
	abbr -a ssc "sudo systemctl"
	abbr -a jc "journalctl"
	abbr -a sjc "sudo journalctl"
	abbr -a g "git"
	abbr -a gi "git init"
	abbr -a gp "git push"
	abbr -a gc "git commit"
	abbr -a gcl "git clone"
	abbr -a ga "git add"
	abbr -a gr "git rebase"
	abbr -a grr "git reset"
	abbr -a gl "git log"
	abbr -a gs "git status"
	abbr -a gd "git diff"
	abbr -a gb "git branch"
end


function fish_greeting
end

function fish_prompt
    echo (set_color -o green)$USER@(prompt_hostname)(set_color normal):(set_color -o blue)(prompt_pwd)(set_color normal)'$ '
end

fish_add_path -aP "/usr/sbin"
fish_add_path -aP "/usr/local/sbin"
fish_add_path -aP "/sbin"
fish_add_path -aP "/home/$USER/.local/bin"

if status is-interactive
    for editor in "kak" "nano"
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

    abbr -a apti "sudo apt install"
    abbr -a aptr "sudo apt remove"
    abbr -a aptu "sudo apt update && sudo apt upgrade"
    abbr -a apts "apt-cache search"
    abbr -a aptc "sudo apt clean && sudo apt autoremove"

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
    abbr -a gss "git show"
end


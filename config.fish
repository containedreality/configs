function fish_greeting
end

# taken from: https://github.com/oh-my-fish/theme-bira/blob/master/functions/fish_prompt.fish, then modified
# this portion until "END OF PROMPT" is subject to https://github.com/oh-my-fish/theme-bira/blob/master/LICENSE
function __user_host
  set -l content 
  if [ (id -u) = "0" ];
    echo -n (set_color --bold red)
  else
    echo -n (set_color --bold green)
  end
  echo -n $USER@(hostname|cut -d . -f 1) (set color normal)
end

function __current_path
  echo -n (set_color --bold blue) (prompt_pwd)(set_color normal)
end

function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function __git_status
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_git_is_dirty) ]
      set git_info '<'$git_branch"*"'>'
    else
      set git_info '<'$git_branch'>'
    end

    echo -n (set_color yellow) $git_info (set_color normal) 
  end
end

function fish_prompt
  echo -n (set_color white)"╭─"(set_color normal)
  __user_host
  __current_path
  __git_status
  echo -e ''
  echo (set_color white)"╰─"(set_color --bold white)"\$ "(set_color normal)
end

function fish_right_prompt
  set -l st $status

  if [ $st != 0 ];
    echo (set_color red) ↵ $st(set_color normal)
  end
end
# END OF PROMPT

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


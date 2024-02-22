# probably very poorly made kakoune configuration
map global normal D xd
map global normal Y xy
map global normal <c-e> ":edit "
map global normal <c-i> ":buffer-previous<ret>"
map global normal <c-o> ":buffer-next<ret>"
map global normal <c-u> ":delete-buffer<ret>"
map global insert <c-l> <esc>glli
map global insert "<c-;>" "<esc>glli;"
map global insert "<c-[>" "<esc>glli {"
map global normal <c-q> ":q!<ret>"
map global insert <c-q> "<esc>:q!<ret>"

add-highlighter global/ number-lines -relative

hook global WinSetOption filetype=(js|c|cc|cpp|sh|rust|python|zig|ruby) %{
	expandtab # must be before softtabstop
	set-option buffer indentwidth 4
	set-option global softtabstop 4 # number of spaces to delete on backspace
}

nop %sh{
    mkdir -p "$kak_config/autoload"
    ln -s "$kak_runtime/rc" "$kak_config/autoload/standard-library"
}

evaluate-commands %sh{
    plugins="$kak_config/plugins"
    mkdir -p "$plugins"
    [ ! -e "$plugins/plug.kak" ] && \
        git clone -q https://github.com/andreyorst/plug.kak.git "$plugins/plug.kak"
    printf "%s\n" "source '$plugins/plug.kak/rc/plug.kak'"
}
plug "andreyorst/plug.kak" noload

plug "andreyorst/smarttab.kak"
plug "alexherbo2/auto-pairs.kak"
plug "occivink/kakoune-sudo-write"
plug "whereswaldon/shellcheck.kak"

enable-auto-pairs

# other defined commands
define-command math -params 1 %{
    evaluate-commands %sh{
        echo 'execute-keys "i%sh{echo $(($1))}<esc>"'
    }
}

syntax on
set number
set nowrap
set relativenumber
set hlsearch
set ts=4
set sw=4
set ai
set si

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.config/nvim/plugins")
	Plug '4513ECHO/vim-colors-hatsunemiku'
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}
	Plug 'mcchrish/nnn.vim'
	Plug 'kyoz/purify', { 'rtp': 'vim' }
	Plug 'vim-airline/vim-airline'
	Plug 'liuchengxu/vista.vim'
call plug#end()

set ve+=onemore
set timeoutlen=2000
let mapleader=' '
nmap <leader>e :NnnPicker <CR>
nmap <leader>fq :q! <CR>
nmap <leader>vs :vertical-split <CR>
nmap <leader>l :vertical resize -10 <CR>
nmap <leader>k :vertical resize +10 <CR>
nmap <leader>j :resize -10 <CR>
nmap <leader>h :resize +10 <CR>
nmap <leader>st :Vista<CR>
nmap <leader>nw :set nowrap <CR>
nmap <leader>sw :set wrap <CR>
nmap j jzz
nmap k kzz
vmap k kzz
vmap j jzz
imap <Esc> <Esc>l
nmap $ $l

colorscheme purify

let g:nnn#set_default_mappings = 0

let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType markdown set spell

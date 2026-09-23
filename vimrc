syntax on
set number relativenumber
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

" remove backup files
set nobackup
set nowritebackup
set noswapfile
set noundofile

" keybinds
imap <C-a> <ESC>0i
imap <C-e> <ESC>$a
nmap <C-a> 0
nmap <C-e> $
nmap <C-s> :w<CR>
nmap <C-q> :q<CR>
imap <C-s> <ESC>:w<CR>i
imap <C-q> <ESC>:q<CR>
map <C-f> <ESC>:e 
map J jzz
map K kzz
map j jzz
map k kzz

" cause of issues with putty
if $TERM == 'xterm'
	colorscheme default
endif

" open at last line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

filetype indent on

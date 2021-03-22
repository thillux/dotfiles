call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'francoiscabrol/ranger.vim'
call plug#end()

filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd CompleteDone * pclose

set number
syntax on

let mapleader=","

set colorcolumn=81
colorscheme molokai

set tabstop=4
set softtabstop=0
set noexpandtab

set ruler
set laststatus=2
set showtabline=2

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

map <F2> :set tabstop=2<CR>
map <F4> :set tabstop=4<CR>
map <F5> :set list!<CR>
map <F6> :set expandtab!<CR>
map <F7> :set invnumber<CR>
map <F8> :set tabstop=8<CR>
map <F9> :FZF<CR>
map <F10> :Rg<CR>
map <F12> :set relativenumber!<CR>

nmap <leader><leader> :tab :term<CR>
nmap <leader>t :tab :term<CR>
nmap <leader>b :bnew<CR>


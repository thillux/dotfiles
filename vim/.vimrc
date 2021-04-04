"""""""""""
" PLUGINS "
"""""""""""
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" fuzzy finder vim integration
Plug 'junegunn/fzf.vim'

" colored status lines
" fuzzy finder
Plug 'vim-airline/vim-airline'

" Git status for vim
Plug 'tpope/vim-fugitive'
" sublie like colorscheme included -> molokai
Plug 'flazz/vim-colorschemes'

" vim integration for ranger file manager
Plug 'francoiscabrol/ranger.vim'

" multi selection plugin
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()


"""""""""""
" GENERAL "
"""""""""""
syntax on
set encoding=utf-8
set number
colorscheme molokai
set colorcolumn=80,120
set shell=/bin/bash

filetype plugin on
set omnifunc=syntaxcomplete"Complete
autocmd CompleteDone * pclose

set tabstop=4
set softtabstop=0
set noexpandtab

set ruler
set laststatus=2
set showtabline=2

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list


""""""""""""""""""""
" VIM FILE MANAGER "
""""""""""""""""""""

" tree style
let g:netrw_liststyle = 3
" no banner
let g:netrw_banner = 0
" open in a new tab
let g:netrw_browse_split = 3
" add number listing for netrw buffers
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'


""""""""""""""""
" KEY BINDINGS "
""""""""""""""""

let mapleader=","

map <F2> :set tabstop=2<CR>
map <F4> :set tabstop=4<CR>
map <F5> :set list!<CR>
map <F6> :set expandtab!<CR>
map <F7> :set invnumber<CR>
map <F8> :set tabstop=8<CR>
map <F9> :FZF<CR>
map <F10> :Rg<CR>
map <F12> :set relativenumber!<CR>

nmap <leader>t :term<CR>
nmap <leader>s :term<CR>
nmap <leader>b :bnew<CR>
nmap <leader>e :Explore<CR>

" line movement (see https://vim.fandom.com/wiki/Moving_lines_up_or_down)
" use Ctrl instead of Alt/Meta to avoid mapping configuration for Alt/Meta
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

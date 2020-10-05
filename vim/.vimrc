set nocompatible

" Enable syntax highlighting
syntax on
filetype plugin indent on

set t_Co=256

" Add line numbers
set number
set ruler

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,space:·,trail:·

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Search related settings
set incsearch
set hlsearch

" Map Ctrl+l to clear highlighted searches
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Disable code folding
set nofoldenable

" make uses real tabs
au FileType make set noexpandtab

function! s:setupMarkup()
	nnoremap <leader>p :silent !open -a Marked.app '%:p'<cr>
endfunction

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

function! s:setupWrapping()
	set wrap
	set wrapmargin=2
	set textwidth=80
endfunction

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" ctrp custom ignores
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.eunit$',
			\ 'file': '\.exe$\|\.so$\|\.dll\|\.beam$\|\.DS_Store$'
			\ }

" netrw settings
let g:netrw_banner = 0


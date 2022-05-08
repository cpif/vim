" Good light-colored scheme
" colorscheme morning
" My favorite colorscheme
colorscheme ron

set shell=/usr/bin/fish

set dictionary=/usr/share/dict/american-english

" Set folders for backup files
set backupdir=~/.vim-temp//
set directory=~/.vim-temp//
set undodir=~/.vim-temp//

" Set search path
set path+=/home/cpif/**

" Set the C Compiler as the program for `make`
set makeprg=gcc\ %

" Wrapping and text display
set encoding=utf-8
set linebreak
set tw=65
set autoindent
set number

" Settings related to the tab key
set expandtab
set tabstop=4
set shiftwidth=4

" Arrow mapping to windows
map <UP> <C-w>k
map <DOWN> <C-w>j
map <LEFT> <C-w>h
map <RIGHT> <C-w>l

" Mapping function keys to window generation
map <F2> <C-w>v
map <F3> <C-w>s

" Print word count
map <F4> :w<CR>:read!wc -w %<CR>

" Print an outline
map <F5> ggO<CR><ESC>:1!sed -n '/^\#/p' %<CR>

" Escape mapping from an online guy
" I also remapped `escape` in normal mode, since it's now freed
" up (could be risky)
inoremap jk <ESC>
inoremap <ESC> -

" Experimental language-specific settings
autocmd Filetype c setlocal encoding=latin1 tw=80
autocmd Filetype html setlocal tw=80
autocmd BufEnter *.awk setlocal tw=0
autocmd BufEnter *.fish setlocal tw=0
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2
autocmd BufEnter *.tsv setlocal noexpandtab tw=0

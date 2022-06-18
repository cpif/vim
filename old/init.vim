" Default text display {{{
set encoding=utf-8
set fileformat=unix
set linebreak
set tw=65
set autoindent
set number
set rnu
set nohlsearch
set foldlevelstart=0
set foldmethod=marker
" }}}

" Display Settings {{{
colorscheme default
hi Normal       ctermfg=grey      ctermbg=black
hi LineNr       ctermfg=lightgrey
hi Folded       ctermfg=black     ctermbg=darkcyan
hi FoldColumn   ctermfg=darkcyan  ctermbg=black

" Don't judge me:
set statusline=¯\\_(ツ)_/¯\ \ \ FILE\ %-25.25f\ \ \ \ LINE\ %3l\ /\ %L\ \ \ \ COL\ %v
" }}}

" Text editing niceties {{{

" Print an outline
nnoremap <F5> ggO<CR><ESC>:1!sed -n '/^\#/p' %<CR>

" Insert a blank line above the current line
nnoremap <leader>o O<ESC>D

" Capitalize all word in normal mode
nnoremap <leader>u gUaw

" Better escaping
inoremap jk <ESC>

" Very magic searching
nnoremap / /\v
nnoremap ? ?\v

" }}}

" Tab key {{{
set expandtab
set tabstop=4
set shiftwidth=4
" }}}

" Writer Mode {{{
" I have two ways of working:
" 1) With plaintext files I want to open in other programs that
"    don't care about long lines
" 2) With plaintext files I will only open in vim.
"
" Writer mode lets me hop between them.
let g:writermode = 0
nnoremap <F6> :exec Writermode()<CR>

function Writermode()
    if g:writermode == 0
        let g:writermode = 1
        set nonumber
        set tw=0
    else
        let g:writermode = 0
        set number
        set tw=65
    endif
endfunction
" }}}

" Search path
set path+=~/**

" I don't like capitalizing
cnorea myvimrc $MYVIMRC

" Externals {{{
set shell=/usr/bin/fish
set dictionary=/usr/share/dict/american-english
set makeprg=gcc\ %
" }}}

" File-specific settings {{{
augroup wrapless
    au!
    au Filetype html,awk,fish   setlocal tw=0
    au Filetype html,awk,fish   setlocal nowrap
augroup END

augroup spreadsheets
    au BufEnter *.tsv  setlocal noexpandtab tw=0
    au BufEnter *.csv  setlocal noexpandtab tw=0
augroup END

au Filetype yaml   setlocal tabstop=2 shiftwidth=2
au Filetype lua    setlocal tabstop=2 shiftwidth=2
" }}}

" Use arrow keys to switch windows {{{
nnoremap <UP> <C-w>k
nnoremap <DOWN> <C-w>j
nnoremap <LEFT> <C-w>h
nnoremap <RIGHT> <C-w>l

" Split previous buffer
nnoremap <LEADER>p :rightbelow vsplit #<CR>
" }}}

" Tiny keyboard {{{
" I have a tiny keyboard missing most of the important symbols.
" These mappings are mostly for writing in markdown.

" Backspace
" inoremap <DEL> "
" Question mark
" inoremap <ESC> ?
" Parentheses
" inoremap <M-p> ()<ESC>i
" Italics
" inoremap <M-i> **<ESC>i
" Bold
" inoremap <M-b> ****<ESC>hi
" Get out of the block
" inoremap ;; <ESC>la
" }}}

" Hide those pesky swapfiles {{{
set backupdir=~/.vim-temp//
set directory=~/.vim-temp//
set undodir=~/.vim-temp//
" }}}

" Rudimentary cipher {{{
function Cipher()
    %normal guu
    %normal g??
    %s/ /​/g
endfunction
nnoremap <F7> :call Cipher()<CR>

function Decipher()
    %normal g??
    %s/​/ /g
endfunction
nnoremap <F8> :call Decipher()<CR>
" }}}
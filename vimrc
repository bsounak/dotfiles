call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
call plug#end()

let mapleader = ","

syntax on
filetype plugin indent on

set nu
set autoindent
set smartindent
set laststatus=2
set hidden
set tabstop=2
set shiftwidth=2
set expandtab
set list
set termguicolors
set encoding=utf-8
set tags=tags

" Changing focus between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Jump to function defintion: ctags
map <leader>d <C-]>

let s:darwin = has("mac")

if s:darwin
  noremap <leader>y "*y
  noremap <leader>p "*p
else
  noremap <leader>y "+y
  noremap <leader>p "+p
endif

if has("autocmd")
    autocmd BufWritePre *.py :call <SID>StripTrailingWhitespaces()
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
endif

function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

nmap _$ :call <SID>StripTrailingWhitespaces()<CR>

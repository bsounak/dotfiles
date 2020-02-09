call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'fcpg/vim-fahrenheit'
call plug#end()

let mapleader = ","
colorscheme fahrenheit

syntax enable
filetype on
set nocompatible
set number
set ruler
set splitbelow
set laststatus=2

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

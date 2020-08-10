let mapleader = ","
let s:darwin = has("mac")

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

nmap <space>l :Files!<CR>
nmap <space>g :GFiles!<CR>
nmap <space>r :Rg!<CR>

Plug 'tpope/vim-fugitive'
nnoremap <leader>d :Gdiff<CR>
nnoremap <leader>s :Gstatus<CR>

Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
Plug 'morhetz/gruvbox'
Plug 'tell-k/vim-autopep8'
let g:autopep8_disable_show_diff=1
call plug#end()

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

set background=dark
colorscheme gruvbox
set colorcolumn=79

" Changing focus between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Jump to function defintion: ctags
map <space>d <C-]>
" Buffers
map <space>n :bn<CR>

"set working directory to the current file
nnoremap <leader>cd :cd %:p:h<CR>

if s:darwin
  noremap <leader>y "*y
  noremap <leader>p "*p
else
  noremap <leader>y "+y
  noremap <leader>p "+p
endif

if has("autocmd")
    autocmd BufWritePre *.py :call StripTrailingWhitespaces()
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
endif

function StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap _$ :call StripTrailingWhitespaces()<CR>

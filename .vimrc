set nocompatible
filetype on
filetype plugin indent on
syntax on
set nu
set clipboard=unnamedplus
set rnu
set shiftwidth=4
set ruler
set encoding=utf-8
set wrap
set autoindent
set smartindent
set mouse=r
set nowrap
set tabstop=2 shiftwidth=2 expandtab
set guifont=JetBrainsMono\ Nerd\ Font\ 22
colorscheme nord

" netrw config
let mapleader = " "
nnoremap <leader>dir :Ex<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25
augroup NetrwNumberFix
  autocmd!
  autocmd FileType netrw setlocal number relativenumber
augroup END

" quality of life keybindings
nnoremap <leader>yf GVggy+
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprevious<CR>
nnoremap <leader>tL :-tabmove<CR>
nnoremap <leader>tH :+tabmove<CR>
tnoremap <esc> <C-w>N
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
noremap <leader>sp :split<CR>
noremap <leader>vsp :vsplit<CR>
noremap <leader>sc :close<CR>

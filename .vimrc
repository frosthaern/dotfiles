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
set guifont=JetBrainsMono\ Nerd\ Font\ 10
colorscheme elflord

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

" quality of life improvements
nnoremap <leader>yf GVggy+

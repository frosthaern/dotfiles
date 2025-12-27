" required plugins are nord.vim and copilot.vim
" just put them in colors/ and pack/ respectively
" for github the url is just there
"
" this is for gui
set guifont=Iosevka\ fixed\ 10
set guioptions=i
set guioptions-=m
set guioptions-=T
set guioptions-=r

" this is for both gui and tui
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
set noswapfile
set scrolloff=10
set hidden
set backspace=indent,eol,start
set ignorecase
set smartcase
set incsearch
set hlsearch
set updatetime=300
set signcolumn=yes
set undofile
set termguicolors
set cursorline
set colorcolumn=100
set showmode
set completeopt=menu,menuone,noselect
set foldmethod=syntax
set foldlevelstart=99
set ttyfast

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'nordtheme/vim'
Plug 'github/copilot.vim'
Plug 'morhetz/gruvbox'
Plug 'm6vrm/gruber.vim'
call plug#end()

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
tnoremap <leader><Esc> <C-\><C-n>
nnoremap <leader>te :terminal<CR>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
noremap <leader>sp :split<CR>
noremap <leader>vsp :vsplit<CR>
noremap <leader>sc :close!<CR>

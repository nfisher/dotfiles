filetype plugin indent on
set nocp

"colorscheme solarized
colorscheme koehler
filetype plugin on
syntax on

let mapleader=';'

set autoindent
set autowrite
set encoding=utf-8
set guioptions-=T
set hlsearch
set ignorecase
set incsearch
set number
set ruler
set scrolloff=2
set shiftwidth=2
set showmatch
set smartcase
set softtabstop=2
set spelllang=en_ca
set tabstop=2
set wildmode=longest,list

noremap <Leader>w <Esc>:w<Return>

" Remap Ctrl-J to write
noremap <C-j> <Esc>:w<Return>
vnoremap <C-j> <Esc>:w<Return>
onoremap <C-j> <Esc>:w<Return>
inoremap <C-j> <Esc>:w<Return>

map <Leader>\ <Plug>RubyTestRun " change from <Leader>t to <Leader>\ 
map <Leader>] <Plug>RubyFileRun " change from <Leader>T to <Leader>] 


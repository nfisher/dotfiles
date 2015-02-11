exec pathogen#infect()

filetype off
filetype plugin indent on
syntax on
set nocp

set autoindent
set autowrite
set encoding=utf-8
set expandtab
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
set synmaxcol=120
set tabstop=2
set wildmode=longest,list

nmap j gj
nmap k gk


" Remap Ctrl-J to write
noremap <C-j> <Esc>:w<Return>
vnoremap <C-j> <Esc>:w<Return>
onoremap <C-j> <Esc>:w<Return>
inoremap <C-j> <Esc>:w<Return>

" RefactorRename()
" Assume most languages will use only the following for variables and
" function/method names [A-Za-z0-9_] (e.g. * will work to capture the filed)
" * => Copy to buffer.
" search project directory using \W pre and post fix w/ vimgrep.
" output to temporary file.
" goto line in files and change content
function! RefactorRename()
  let l:previous_z = @z
  norm *"zyw
  let l:name = input('Rename "'.@z.'": ')
  if l:name == ''
    " User didn't supply a new name
    echo "Abandoned rename"
  else
    exec 'vimgrep /\(\W\)'.@z.'\(\W\)/ **'
    for item in getqflist()
      echo bufname(item['bufnr']).' ('.item['lnum'].', '.item['col'].')'.item['text']
    endfor
  endif
  norm ``
  let l:response = input('Begin Refactor (y/n): ')
  if l:response == 'n' || l:response == 'N'
    echo "Aborting rename"
    return
  endif
  let @z = l:previous_z
endf

nmap <S-F6> :call RefactorRename()<CR>

function! MakeTest(test)
  exe "make! -j2 " . a:test
endf
let g:test_target = "test"
nmap <Leader>t :call MakeTest(g:test_target)<CR>

autocmd BufWritePost *.go silent! !gotags -R=true . > tags &

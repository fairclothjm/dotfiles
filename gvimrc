" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show cursor position all the time
set ruler
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set nu              " show line numbers
set autoindent
set nowrap

" tab
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" window size
set lines=50 columns=86

" cmd + number for switching tabs
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> 0gt

" toggle comment
map <D-/> q

" font and color scheme
set guifont=Menlo\ Regular:h13
syntax enable


" colorcolumn
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif

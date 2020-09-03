filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'tpope/vim-fugitive'
Plugin 'delimitMate.vim'
Plugin 'fatih/vim-go'

" editor and file exploration
Plugin 'bufexplorer.zip'
Plugin 'scrooloose/nerdtree'

" Javascript: syntax highlighting and improved indentation
Plugin 'pangloss/vim-javascript.git'
Plugin 'mxw/vim-jsx'
Plugin 'Chiel92/vim-autoformat'         " enable for JS autoformatting

"Plugin 'alunny/pegjs-vim'
"Plugin 'psf/black'                     " python formatting (currently broken)

call vundle#end()            " required
filetype plugin indent on    " required

if has('termguicolors')
  set termguicolors
endif

" wrap long lines in quickfix
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

" adjust quickfix window height automatically
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" search for visual selection
:vn // y/<C-R>"<CR>

" dont require .jsx extension for  mxw/vim-jsx syntax plugin
let g:jsx_ext_required = 0


" * * * * * * * * * *
" vim settings
"
set path+=**

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" show cursor position
set ruler

" Delete comment character when joining commented lines
set formatoptions+=j

"do incremental searching
set incsearch
set hlsearch

set autoindent
set nowrap

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" allow OS clipboard
set clipboard=unnamed

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Show horizontal cursor line
set cursorline

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

set cmdheight=2

set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" tab
set shiftwidth=4
set softtabstop=4
set expandtab

set colorcolumn=80

set clipboard=unnamed

" error highlight whitespace
augroup whitespace
    autocmd!
    highlight ExtraWhitespace ctermbg=red guibg=darkred
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=darkred
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END


" * * * * * * * * * *
" color

colo thanatos

syntax on

" identify the syntax highlighting group used at the cursor
map <F10> :echo "hi<"
    \ . synIDattr(synID(line("."),col("."),1),"name") . "> trans<"
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" * * * * * * * * * *
" filetype specific options
augroup filetype
    autocmd!
    autocmd Filetype javascript setlocal ts=2 sw=2 sts=2
    autocmd Filetype json setlocal ts=2 sw=2 sts=2
    autocmd Filetype scss setlocal ts=2 sw=2 sts=2
augroup END

" format json in visual or select mode with  =j
nmap =j :%!python -m json.tool<CR>


" * * * * * * * * * *
" auto format on save
au BufWrite *.js :Autoformat
"au BufWrite *.py :Black


" * * * * * * * * * *
" Leader mappings
let mapleader = ","
nmap <leader>ne :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>Gr :grep <C-R><C-W> **/* <CR>:cw<CR>
nnoremap <leader>gr :grep <C-R><C-W>
" copy current file path
nnoremap <leader>cf :let @*=expand("%:p")<CR>
" clear hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <leader>s :%s/<C-R><C-W>/


" * * * * * * * * * *
" vim-go
nmap <leader>gor :GoRun<cr>
nmap <leader>got :GoTest<cr>
nmap <leader>goi :GoImport

let g:go_list_type = "quickfix"         " do not use location list
let g:go_template_autocreate = 0        " disable vim-go template

let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1

let g:go_metalinter_autosave=0
let g:go_metalinter_autosave_enabled=['golint', 'errcheck', 'deadcode']


" ctrl-j and ctrl-k to jump through quickfix list
map <C-j> :cn<CR>
map <C-k> :cp<CR>


" * * * * * * * * * *
" snippets

" go
nnoremap <leader>ger <ESC> :read $HOME/code/dotfiles/vim/snippets/go/err <CR>=%o

" markdown
nnoremap <leader>cb :read $HOME/code/dotfiles/vim/snippets/md/codeblock<CR>o

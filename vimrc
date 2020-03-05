set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

Plugin 'flazz/vim-colorschemes'

Plugin 'delimitMate.vim'

Plugin 'fatih/vim-go'

Plugin 'bufexplorer.zip'

" nerdtree
Plugin 'scrooloose/nerdtree'

Plugin 'captbaritone/better-indent-support-for-php-with-html'

" Javascript: syntax highlighting and improved indentation
Plugin 'pangloss/vim-javascript.git'
Plugin 'mxw/vim-jsx'

Plugin 'aperezdc/vim-template'

" PEGjs syntax
Plugin 'alunny/pegjs-vim'

" enable for JS autoformatting
Plugin 'Chiel92/vim-autoformat'

" python formatting
Plugin 'psf/black'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Leader
let mapleader = ","
nmap <leader>ne :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>g :grep <C-R><C-W> **/* -s<CR>:cw<CR>
" copy current file path
nnoremap <leader>cf :let @*=expand("%:p")<CR>
" window nav
nnoremap <leader>f <C-W>l
nnoremap <leader>a <C-W>h
nnoremap <leader>w <C-W>k
nnoremap <leader>s <C-W>j
nnoremap <leader>c <C-W>c
" clear hlsearch
nnoremap <leader><space> :noh<cr>

" vim-go
nmap <leader>gr :GoRun<cr>

" ctrl-j and ctrl-k to jump through quickfix list
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" format json in visual or select mode with  =j
nmap =j :%!python -m json.tool<CR>

" dont require .jsx extension for  mxw/vim-jsx syntax plugin
let g:jsx_ext_required = 0

" disable vim-go template
let g:go_template_autocreate = 0
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
" use gofmt on save instead of the default goimports
" let g:go_fmt_command = "gofmt"

" show errors
let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['golint', 'errcheck', 'deadcode']

set path+=**

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" show cursor position
set ruler

"do incremental searching
set incsearch

set autoindent
set nowrap

" Highlight searches
set hlsearch

" search for visual selection
:vn // y/<C-R>"<CR>

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

" Set the command window height to 2 lines, to avoid many cases of having to
"press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number
set rnu

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" tab
set shiftwidth=4
set softtabstop=4
set expandtab

" show tab as 4 spaces for Go
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" color
" colo jelleybeans
" colo lucius
colo lucidity
"colo PaperColor
"set background=light
"set background=dark
syntax on

" clipboard
set clipboard=unnamed

" side marker for < 80 chars
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80.\+', -1)
endif

augroup ErrorHiglights
    autocmd!
    autocmd WinEnter,BufEnter * call clearmatches() | call matchadd('ErrorMsg', '\s\+$', 100)
augroup END

" filetype specific options
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2
autocmd Filetype json setlocal ts=2 sw=2 sts=2
autocmd Filetype scss setlocal ts=2 sw=2 sts=2

" auto format on save
au BufWrite *.js :Autoformat
au BufWrite *.py :Black

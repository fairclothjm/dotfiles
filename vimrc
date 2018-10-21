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

" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

Plugin 'flazz/vim-colorschemes'

Plugin 'delimitMate.vim'

Plugin 'bufexplorer.zip'

" fuzzy search
Plugin 'ctrlp.vim'

" nerdtree
Plugin 'scrooloose/nerdtree'

" cpp highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'

" vim-javacomplete2
Plugin 'artur-shaik/vim-javacomplete2'

Plugin 'fatih/vim-go'

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
 
" Search recursively; provide tab completion
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
" set clipboard=unnamed

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
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
 
" color
" colo jelleybeans
colo PaperColor
set background=light
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

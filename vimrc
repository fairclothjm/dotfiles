" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
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
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" tab 
set shiftwidth=4
set softtabstop=4
set expandtab
 
 


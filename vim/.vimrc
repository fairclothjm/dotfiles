call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" editor and file exploration
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'

" syntax
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jvirtanen/vim-hcl'
"Plug 'maxmellon/vim-jsx-pretty'
"Plug 'Chiel92/vim-autoformat'
"Plug 'psf/black'

call plug#end()


" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
" autocommands
"

" auto format on save
augroup autofmt
    autocmd!
    "au BufWrite *.js :Autoformat
    "au BufWrite *.py :Black
augroup END

" error highlight whitespace
augroup whitespace
    autocmd!
    highlight ExtraWhitespace ctermbg=red guibg=darkred
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=darkred
    autocmd BufEnter * match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END

" only show the cursor line in the active buffer.
augroup CursorLine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
" vim settings
"
set autoindent
set backspace=indent,eol,start
set clipboard=unnamed
set cmdheight=2
set colorcolumn=80
set confirm
set cursorline
set expandtab
set formatoptions+=j
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set nostartofline
set noswapfile
set notimeout ttimeout ttimeoutlen=200
set nowrap
set number
set path+=**
set ruler
set shiftround
set shiftwidth=4
set showcmd
set smartcase
set softtabstop=4
set t_vb=
set visualbell
set wildmenu


" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
" color
"

if has('termguicolors')
    set termguicolors
endif

syntax on
colo thanatos

" identify the syntax highlighting group used at the cursor
map <F10> :echo "hi<"
    \ . synIDattr(synID(line("."),col("."),1),"name") . "> trans<"
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
" Mappings
"

" ctrl-j and ctrl-k to jump through quickfix list
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" format json in visual or select mode with  =j
nmap =j :%!python -m json.tool<CR>

" search for visual selection
:vn // y/<C-R>"<CR>

" do NOT yank with x/s
nnoremap x "_x
nnoremap s "_s

" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
" Leader mappings
"

let mapleader = ","
nmap <leader>dt :windo diffthis<cr>
nmap <leader>do :diffoff<cr>
nmap <leader>w :w<cr>
nmap <leader>m :make<cr>

" file searching
nnoremap <leader>Gr :grep -r <C-R><C-W> **/* <CR>
nnoremap <leader>gr :grep -r --exclude-dir={mocks,} <C-R><C-W>

" copy current file path
nnoremap <leader>cf :let @*=expand("%:p")<CR>
" open current file in Chrome Browser
nnoremap <leader>vf :! open -a "Google Chrome" %<CR>

" clear hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <leader>s :%s/<C-R><C-W>/

" insert date
nnoremap <leader>date "=strftime("%F")<CR>P

" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
" Plugin configuration
"

" nerdtree
nmap <leader>ne :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>

" To see all leader mappings:
" vim -c 'set t_te=' -c 'set t_ti=' -c 'map ,' -c q | sort

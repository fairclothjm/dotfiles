call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-apathy'

Plug 'AndrewRadev/splitjoin.vim'

" editor and file exploration
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'

" syntax
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jvirtanen/vim-hcl'

Plug 'arcticicestudio/nord-vim'

"Plug 'maxmellon/vim-jsx-pretty'
"Plug 'Chiel92/vim-autoformat'
"Plug 'psf/black'

call plug#end()


" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" autocommands
"

augroup Skeleton
  autocmd!
  autocmd BufNewFile *.sh 0r ~/.vim/templates/bash/skeleton.sh
augroup END

" auto format on save
" augroup autofmt
"     autocmd!
"     au BufWrite *.js :Autoformat
"     au BufWrite *.py :Black
" augroup END

" error highlight whitespace
augroup Whitespace
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

" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
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
set iskeyword+=-
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
set splitbelow
set splitright
set t_vb=
set visualbell
set wildignore+=*/node_modules/*,*/__pycache__/,*/venv/*,*/.venv/*,.git,.git/*
set wildmenu

" keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let undopath = expand('/tmp/vimundo')
    :silent call system('mkdir -p ' . undopath)
    let &undodir=undopath
    set undofile
endif

" set grepprg as RipGrep, fallback to grep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
else
    let &grepprg='grep -n -r --exclude=' . shellescape(&wildignore) . ' $* .'
endif

" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" color
"

if has('termguicolors')
    set termguicolors
endif

augroup nord-theme-overrides
  autocmd!
  " use a darker background color for nord vim
  autocmd ColorScheme nord highlight Normal ctermbg=NONE guibg=#1c1e24
augroup END

syntax on
set background=dark
colo nord

" identify the syntax highlighting group used at the cursor
map <F10> :echo "hi<"
    \ . synIDattr(synID(line("."),col("."),1),"name") . "> trans<"
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" Mappings
"

" ctrl-j and ctrl-k to jump through quickfix list
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" format json in visual or select mode with  =j
nmap =j :%!python -m json.tool<CR>

" search for visual selection
:vn // y/<C-R>"<CR>

" Swap ` and ' for marks; go to line and col of mark with '
nnoremap ' `
nnoremap ` '

" do NOT yank with x/s
nnoremap x "_x
nnoremap s "_s

" indent blocks without losing the selection
xnoremap < <gv
xnoremap > >gv

" make Y act like D and C; yank from cursor to eol
nnoremap Y y$

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if !exists(":EditFtplugin")
    command! -complete=filetype -nargs=? EditFtplugin execute 'edit ~/.vim/ftplugin/'
                \. (empty(expand('<args>')) ? &filetype : expand('<args>')) . '.vim'
endif

" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" Leader mappings
"

let mapleader = ","
nmap <leader>vv :edit $MYVIMRC<CR>
nmap <leader>dt :windo diffthis<CR>
nmap <leader>do :diffoff<CR>
nmap <leader>w :w<CR>
nmap <leader>m :make<CR>

" file searching
nnoremap <leader>gg :grep "<C-R><C-W>" <CR>

" copy current file path
nnoremap <leader>cf :let @*=expand("%:p")<CR>
" open current file in Chrome Browser
nnoremap <leader>vf :! open -a "Google Chrome" %<CR>

" clear hlsearch
nnoremap <leader><space> :noh<CR>
" search and replace word under cursor
nnoremap <leader>sr :%s/<C-R><C-W>/


" insert date
nnoremap <leader>date "=strftime("%F")<CR>P

" insert shell skeleton
nnoremap <leader>sh :0r ~/.vim/templates/bash/skeleton.sh<CR>G
nnoremap <leader>` i```<CR>```<ESC>O

" # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" Plugin configuration
"

" nerdtree
nmap <leader>ne :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

" To see all leader mappings:
" vim -c 'set t_te=' -c 'set t_ti=' -c 'map ,' -c q | sort

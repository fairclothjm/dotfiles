call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'

" editor and file exploration
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'

" syntax
Plug 'Chiel92/vim-autoformat'
Plug 'fatih/vim-go'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'psf/black'

call plug#end()


" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
" autocommands
"

" auto format on save
augroup autofmt
    au BufWrite *.js :Autoformat
    "au BufWrite *.py :Black
augroup END

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

" only show the cursor line in the active buffer.
augroup CursorLine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" wrap long lines in quickfix
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

" adjust quickfix window height automatically
augroup quickfix
    autocmd!
    autocmd FileType qf call AdjustWindowHeight(3, 10)
augroup END

function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction


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


" * * * * * * * * * *
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


" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
" Leader mappings
"

let mapleader = ","
nmap <leader>ne :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>Gr :grep -r <C-R><C-W> **/* <CR>
nnoremap <leader>gr :grep -r --exclude-dir={mocks,} <C-R><C-W>
" copy current file path
nnoremap <leader>cf :let @*=expand("%:p")<CR>
" clear hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <leader>s :%s/<C-R><C-W>/


" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
" Plugin configuration
"

" black
let g:black_virtualenv = "~/.vim/plugged/blackvenv"

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


" To see all leader mappings:
" vim -c 'set t_te=' -c 'set t_ti=' -c 'map ,' -c q | sort

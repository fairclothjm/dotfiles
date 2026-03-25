vim9script

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Plugins
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

plug#begin('~/.vim/plugged')

# Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-apathy'

Plug 'AndrewRadev/splitjoin.vim'

# editor and file exploration
Plug 'jlanzarotta/bufexplorer'
Plug 'preservim/nerdtree'

# syntax
Plug 'fatih/vim-go'
# Plug 'jvirtanen/vim-hcl'
Plug 'hashivim/vim-terraform'

Plug 'arcticicestudio/nord-vim'

# Plug 'maxmellon/vim-jsx-pretty'
# Plug 'Chiel92/vim-autoformat'
# Plug 'psf/black'

# help me please
Plug 'github/copilot.vim'

plug#end()

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Functions
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

def FilterQuickfixList(bang: bool, pattern: string)
    var cmp = bang ? '!~#' : '=~#'
    setqflist(getqflist()->filter((_, val) => bufname(val.bufnr) =~# pattern ? !bang : bang))
enddef
# use :QFilter! PATTERN to remove results that match the pattern
command! -bang -nargs=1 -complete=file QFilter FilterQuickfixList(<bang>0, <q-args>)

def QuickFixTree(location: number = 0)
    var entries: list<dict<any>>
    var list_name: string
    if location == 1
        entries = getloclist(0)
        list_name = "Location"
    else
        entries = getqflist()
        list_name = "Quickfix"
    endif

    if empty(entries)
        echo $'{list_name} list is empty'
        return
    endif

    var paths = entries->mapnew((_, entry) => fnamemodify(bufname(entry.bufnr), ":p:."))
    echo system("tree -a --fromfile .", join(paths, "\n"))
enddef

command! TreeLoc QuickFixTree(1)
command! TreeQuick QuickFixTree(0)

# Begin whitespace management logic using Text Properties (Vim 9.2+)
# 1. Initialize Property Type (Runs once at script load)
hi ExtraWhitespace ctermbg=red guibg=darkred
if empty(prop_type_get('ExtraWhitespace'))
    prop_type_add('ExtraWhitespace', {highlight: 'ExtraWhitespace', priority: 10})
endif

# 2. Function to highlight trailing spaces using Text Properties
def HighlightTrailingWhitespace(line1: number, line2: number)
    for lnum in range(line1, line2)
        var line_text = getline(lnum)
        var col = match(line_text, '\s\+$')
        # Clear existing props on this line first
        prop_clear(lnum, lnum, {type: 'ExtraWhitespace'})
        if col != -1
            # Add property to the trailing spaces (1-indexed)
            prop_add(lnum, col + 1, {
                type: 'ExtraWhitespace',
                length: len(line_text) - col
            })
        endif
    endfor
enddef
# End whitespace management logic

def TrimWhitespace()
    var save = winsaveview()
    keeppatterns :%s/\s\+$//e
    # In 9.2, manually clear properties for the whole buffer after trimming
    prop_clear(1, line('$'), {type: 'ExtraWhitespace'})
    winrestview(save)
enddef

command! TrimWhitespace TrimWhitespace()

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Unified Autocommands
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

augroup MyVim9Autocmds
    autocmd!

    # 1. Skeletons
    autocmd BufNewFile *.sh 0r ~/.vim/templates/bash/skeleton.sh

    # Whitespace Management (Text Properties Logic)
    autocmd ColorScheme * hi ExtraWhitespace ctermbg=red guibg=darkred

    # Trigger highlighting on entry or read
    autocmd BufReadPost,BufEnter * HighlightTrailingWhitespace(1, line('$'))

    # Update only the current line when text changes
    autocmd TextChanged,TextChangedI * HighlightTrailingWhitespace(line('.'), line('.'))

    # Clean up properties when leaving the buffer
    autocmd BufWinLeave * prop_clear(1, line('$'), {type: 'ExtraWhitespace'})

    # 3. Dynamic UI (CursorLine)
    autocmd WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline

    # 4. Autoformat (Commented out but preserved)
    # autocmd BufWrite *.js :Autoformat
    # autocmd BufWrite *.py :Black
    # autocmd BufWrite *.tf,*.hcl :% !terraform fmt -

    # Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * {
        if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
            quit
        endif
    }

augroup END

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# vim settings
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

set autoindent
set autowrite
set clipboard=unnamed
set cmdheight=1
set colorcolumn=80
set confirm
set cursorline
# Optimized for 9.2 Linematch algorithm
set diffopt=filler,internal,algorithm:histogram,indent-heuristic,linematch:60
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

# Persistent undo logic for 9.2
if has('persistent_undo')
    var undo_dir = expand('~/.local/share/vim/undo')
    if !isdirectory(undo_dir) | mkdir(undo_dir, 'p', 0700) | endif
    &undodir = undo_dir
    set undofile
endif

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m
else
    &grepprg = 'grep -n -r --exclude=' .. shellescape(&wildignore) .. ' $* .'
endif

command! -nargs=+ -complete=file Grep execute 'silent grep <args>' | redraw!
cnoreabbrev <expr> grep (getcmdtype() ==# ':' && getcmdline() =~# '^grep') ? 'Grep' : 'grep'

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# color
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

if has('termguicolors')
    set termguicolors
endif

set t_ut=
augroup nord-theme-overrides
    autocmd!
    autocmd ColorScheme nord highlight Normal guibg=#1c1e24
    autocmd ColorScheme nord highlight NonText guibg=#1c1e24
    autocmd ColorScheme nord highlight EndOfBuffer guibg=#1c1e24
    autocmd ColorScheme nord highlight MatchParen term=reverse ctermfg=0 ctermbg=6 guifg=#3B4252 guibg=#88C0D0
augroup END

syntax on
set background=dark
colorscheme nord

# identify syntax group at cursor
nnoremap <F10> <script>
    \ :echo "hi<"
    \ .. synIDattr(synID(line("."), col("."), 1), "name") .. "> trans<"
    \ .. synIDattr(synID(line("."), col("."), 0), "name") .. "> lo<"
    \ .. synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name") .. ">"<CR>

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Mappings
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

noremap <space>u <C-U>zz
noremap <space>d <C-D>zz
noremap <space>r <C-R>
noremap <space>j <C-W>j
noremap <space>k <C-W>k
noremap <space>h <C-W>h
noremap <space>l <C-W>l
noremap <space>o <C-W>o
noremap <space>c <C-W>c
noremap <Up> <C-U>zz
noremap <Down> <C-D>zz
noremap <C-j> :cn<CR>zz
noremap <C-k> :cp<CR>zz
nnoremap =j :%!python3 -m json.tool<CR>

vnoremap <silent> * :<C-U><script>
    \ var old_reg = getreg('"'); var old_regtype = getregtype('"');
    \ gvy/<C-R><C-R>=substitute(escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \ gV:call setreg('"', old_reg, old_regtype)<CR>

nnoremap ' `
nnoremap ` '
nnoremap x "_x
nnoremap s "_s
xnoremap < <gv
xnoremap > >gv
nnoremap Y y$

if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

if !exists(":EditFtplugin")
    command! -complete=filetype -nargs=? EditFtplugin execute 'edit ~/.vim/ftplugin/'
        \ .. (empty(expand('<args>')) ? &filetype : expand('<args>')) .. '.vim'
endif

if !exists(":TfDoc")
    command! -complete=filetype -nargs=? TfDoc execute 'edit ~/.vim/ftplugin/'
        \ .. (empty(expand('<args>')) ? &filetype : expand('<args>')) .. '.vim'
endif

g:terraform_fmt_on_save = 1
g:terraform_align = 1


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Helper Functions for Robust Mappings
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Copy absolute path to clipboard
def CopyFilePath()
    setreg('*', expand("%:p"))
    echo "Copied path: " .. expand("%:p")
enddef

# Copy dlv breakpoint format: b file:line
def CopyBreakpoint()
    var bp = $"b {expand('%')}:{line('.')}"
    setreg('*', bp)
    echo "Breakpoint copied: " .. bp
enddef

# Open current file in Chrome
def OpenInChrome()
    silent execute $'!open -a "Google Chrome" {expand("%:p")}'
enddef

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Leader Mappings
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

g:mapleader = ","

# Navigation & File
nnoremap <leader>vv :edit $MYVIMRC<CR>
nnoremap <leader>q  :q<CR>
nnoremap <leader>w  :w<CR>
nnoremap <leader>mm :make<CR>

# Diff Operations
nnoremap <leader>dt :windo diffthis<CR>
nnoremap <leader>do :diffoff<CR>

# Search (Grep & Find)
# Using <expr> or the new 9.2 expansion logic makes these more reliable
nnoremap <leader>gg  :Grep "<C-R><C-W>" -g "!*_test.go" -g "!*.proto" <CR>
nnoremap <leader>tgg :Grep "<C-R><C-W>" -g "*_test.go" <CR>
nnoremap <leader>td  :Grep "TODO(JM)" <CR>
nnoremap <leader>ff  :find **/<C-R><C-W><Left>
nnoremap <leader>ft  :QFilter! test<CR>

# Clipboard & System Integration
# Now calling compiled functions for speed and reliability
nnoremap <silent> <leader>cf :call <SID>CopyFilePath()<CR>
nnoremap <silent> <leader>bp :call <SID>CopyBreakpoint()<CR>
nnoremap <silent> <leader>vf :call <SID>OpenInChrome()<CR>

# GitHub / Markdown
noremap <leader>cl :GBrowse!<CR>
noremap <leader>ml S]f]a()<ESC>P
nnoremap <leader>cb i```<CR>```<ESC>O

# Editor Utilities
nnoremap <leader><space> :noh<CR>
nnoremap <leader>sr  :%s/<C-R><C-W>/
nnoremap <leader>tsr :%s/<C-R>"/consts.Field/
nnoremap <leader>date "=strftime("%F")<CR>P
nnoremap <leader>sh  :0r ~/.vim/templates/bash/skeleton.sh<CR>G
nnoremap <leader>`   ysiw`

# Execution
nnoremap <F9> :!clear && %:p<Enter>

# Plugin: NERDTree
nnoremap <leader>ne :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>


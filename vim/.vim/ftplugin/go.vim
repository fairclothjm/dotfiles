" vim-go

if getcwd() == $HOME."/hc/vault-enterprise"
    let g:go_build_tags ="enterprise"
endif

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

nmap <leader>ga :GoAlternate<CR>
nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
nmap <leader>ge :GoIfErr<CR>kkb
nmap <leader>gf :GoReferrers<CR>
nmap <leader>gr :GoRun<CR>
nmap <leader>gR :GoRun %<CR>
nmap <leader>gt :GoTest<CR>
nmap <leader>gT :GoTestFunc<CR>
nmap <leader>gp :tabnew /Users/$USER/code/go/test/main.go<CR>

" trick to restart LSP: https://github.com/fatih/vim-go/issues/2550
nmap <leader>gx :GoBuildTags ''<CR>

" vim-go debugging
" let g:go_debug = ['shell-commands']
" let g:go_debug = ['lsp']

let g:go_list_type = "quickfix"         " do not use location list
let g:go_template_autocreate = 0        " disable vim-go template

let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1

let g:go_metalinter_autosave=0
let g:go_metalinter_autosave_enabled=['golint', 'errcheck', 'deadcode']
let g:go_metalinter_command='golangci-lint'
let g:go_metalinter_enabled = [] " use repo config/defaults for golangci-lint

let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=1

let g:go_test_timeout='25s'

" abbreviations
iabbrev <buffer> iferr <ESC>:.-1read ~/.vim/templates/go/err.go<CR>2=<CR>o
iabbrev <buffer> fmain <ESC>:0read ~/.vim/templates/go/main.go<CR>2jo
iabbrev <buffer> gswitch <ESC>:.-1read ~/.vim/templates/go/switch.go<CR>3=<CR>j2Wi

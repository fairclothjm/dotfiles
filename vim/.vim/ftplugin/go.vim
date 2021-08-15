" vim-go
nmap <leader>goa :GoAlternate<cr>
nmap <leader>gor :GoRun<cr>
nmap <leader>goR :GoRun %<cr>
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

let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=1

let g:go_test_timeout='25s'

" abbreviations
iabbrev <buffer> iferr <ESC>:.-1read ~/.vim/templates/go/err.go<CR>2=<CR>o
iabbrev <buffer> fmain <ESC>:0read ~/.vim/templates/go/main.go<CR>2jo
iabbrev <buffer> switch <ESC>:.-1read ~/.vim/templates/go/switch.go<CR>3=<CR>j2Wi

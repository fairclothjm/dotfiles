" vim-go
nmap <leader>goa :GoAlternate<CR>
nmap <leader>gob :GoBuild<CR>
nmap <leader>gof :GoReferrers<CR>
nmap <leader>gor :GoRun<CR>
nmap <leader>goR :GoRun %<CR>
nmap <leader>got :GoTest<CR>
nmap <leader>goT :GoTestCompile<CR>
nmap <leader>goi :GoImport
nmap <leader>gop :tabnew /Users/$USER/code/go/test/main.go<CR>

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
iabbrev <buffer> gswitch <ESC>:.-1read ~/.vim/templates/go/switch.go<CR>3=<CR>j2Wi

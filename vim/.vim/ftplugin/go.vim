vim9script

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Enterprise Build Tags Logic
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

var ent_repos = [
    expand("$HOME/hc/plugin/vault-plugin-database-oracle-enterprise"),
    expand("$HOME/hc/plugin/vault-plugin-secrets-keymgmt"),
    expand("$HOME/hc/plugin/vault-plugin-secrets-openldap-enterprise"),
    expand("$HOME/hc/plugin/vault-plugin-secrets-os"),
    expand("$HOME/hc/vault-enterprise"),
]

if index(ent_repos, getcwd()) >= 0
    g:go_build_tags = "enterprise"
endif

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Functions
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

def BuildGoFiles()
    var fname = expand('%')
    if fname =~# '^\f\+_test\.go$'
        go#test#Test(0, 1)
    elseif fname =~# '^\f\+\.go$'
        go#cmd#Build(0)
    endif
enddef

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Mappings (Buffer Local)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Use <buffer> for ftplugin mappings so they don't leak into other filetypes
nnoremap <buffer> <leader>ga :GoAlternate<CR>
nnoremap <buffer> <leader>gb :call <SID>BuildGoFiles()<CR>
nnoremap <buffer> <leader>ge :GoIfErr<CR>kkb
nnoremap <buffer> <leader>gf :GoReferrers<CR>
nnoremap <buffer> <leader>gr :GoRun<CR>
nnoremap <buffer> <leader>gR :GoRun %<CR>
nnoremap <buffer> <leader>gt :GoTest<CR>
nnoremap <buffer> <leader>gT :GoTestFunc<CR>
nnoremap <buffer> <leader>gp :tabnew /Users/$USER/code/go/test/main.go<CR>

# Restart LSP trick
nnoremap <buffer> <leader>gx :GoBuildTags ''<CR>

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# vim-go configurations
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

g:go_list_type = "quickfix"
g:go_template_autocreate = 0

g:go_highlight_structs = 1
g:go_highlight_methods = 1
g:go_highlight_functions = 1
g:go_highlight_operators = 1

g:go_metalinter_autosave = 0
g:go_metalinter_autosave_enabled = ['golint', 'errcheck', 'deadcode']
g:go_metalinter_command = 'golangci-lint'
g:go_metalinter_enabled = []

g:go_fmt_command = "gopls"
g:go_gopls_gofumpt = 1
g:go_test_timeout = '25s'

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Abbreviations
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

iabbrev <buffer> iferr <ESC>:.-1read ~/.vim/templates/go/err.go<CR>2==o
iabbrev <buffer> fmain <ESC>:0read ~/.vim/templates/go/main.go<CR>2jo
iabbrev <buffer> gswitch <ESC>:.-1read ~/.vim/templates/go/switch.go<CR>3==j2Wi

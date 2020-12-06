" * * * * * * * * * * * * *
" Vim color file - thanatos
"
" Test these colors with:
"   `:so $VIMRUNTIME/syntax/hitest.vim`
" or
"   `:hi`
"
" It is recommended to set the following in your vimrc:
"    ```
"    if has('termguicolors')
"      set termguicolors
"    endif
"    ```
"

hi clear
if exists("syntax_on")
        syntax reset
endif

set background=dark
let g:colors_name = "thanatos"

hi CTagsClass guifg=#2459e0 guibg=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#1f1f1f gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
hi Comment guifg=#6c6d70 guibg=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
hi Constant guifg=#789196 guibg=NONE gui=NONE ctermfg=66 ctermbg=NONE cterm=NONE
hi Cursor guifg=#192224 guibg=#b3b3b3 gui=NONE ctermfg=235 ctermbg=249 cterm=NONE
hi CursorColumn guifg=NONE guibg=#222E30 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi CursorIm guifg=#192224 guibg=#536991 gui=NONE ctermfg=235 ctermbg=60 cterm=NONE
hi CursorLine guifg=NONE guibg=#1f1f1f gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
hi CursorLineNr guifg=#e0e0e0 guibg=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi Debug guifg=#BD9800 guibg=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Delimiter guifg=#d4d4d4 guibg=NONE gui=NONE ctermfg=188 ctermbg=NONE cterm=NONE
hi DiffAdd guifg=NONE guibg=#193224 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi DiffChange guifg=NONE guibg=#492224 gui=NONE ctermfg=NONE ctermbg=52 cterm=NONE
hi DiffDelete guifg=NONE guibg=#192224 gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
hi Directory guifg=#536991 guibg=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=bold
hi Error guifg=#A1A6A8 guibg=#912C00 gui=NONE ctermfg=248 ctermbg=88 cterm=NONE
hi ErrorMsg guifg=#A1A6A8 guibg=#4a1701 gui=NONE ctermfg=248 ctermbg=52 cterm=NONE
hi FoldColumn guifg=#192224 guibg=#A1A6A8 gui=NONE ctermfg=235 ctermbg=248 cterm=NONE
hi Folded guifg=#192224 guibg=#A1A6A8 gui=NONE ctermfg=235 ctermbg=248 cterm=NONE
hi Function guifg=#6490db guibg=NONE gui=NONE ctermfg=68 ctermbg=NONE cterm=NONE
hi Identifier guifg=#cccccc guibg=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
hi LineNr guifg=#6b6a6a guibg=#1c1b1c gui=NONE ctermfg=242 ctermbg=234 cterm=NONE
hi LocalVariable guifg=#f0f0f0 guibg=NONE gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi MatchParen guifg=#131314 guibg=#a39ea3 gui=NONE ctermfg=233 ctermbg=248 cterm=bold
hi ModeMsg guifg=#14140f guibg=#cccccc gui=NONE ctermfg=232 ctermbg=252 cterm=NONE
hi MoreMsg guifg=#BD9800 guibg=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=bold
hi NonText guifg=#5E6C70 guibg=NONE gui=NONE ctermfg=66 ctermbg=NONE cterm=NONE
hi Normal guifg=#cccccc guibg=#14140f gui=NONE ctermfg=252 ctermbg=233 cterm=NONE
hi PMenu guifg=#c2c2c2 guibg=#252429 gui=NONE ctermfg=7 ctermbg=235 cterm=NONE
hi PMenuSbar guifg=NONE guibg=#848688 gui=NONE ctermfg=NONE ctermbg=102 cterm=NONE
hi PMenuThumb guifg=NONE guibg=#a4a6a8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
hi PreProc guifg=#993333 guibg=NONE gui=NONE ctermfg=88 ctermbg=NONE cterm=NONE
hi Search guifg=#14140f guibg=#b3b3b3 gui=underline ctermfg=232 ctermbg=252 cterm=underline
hi SignColumn guifg=#192224 guibg=#536991 gui=NONE ctermfg=235 ctermbg=60 cterm=NONE
hi Special guifg=#cccccc guibg=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
hi SpecialComment guifg=#BD9800 guibg=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi SpecialKey guifg=#5E6C70 guibg=NONE gui=NONE ctermfg=66 ctermbg=NONE cterm=NONE
hi SpellBad guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi SpellCap guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi SpellLocal guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi SpellRare guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Statement guifg=#993333 guibg=NONE gui=NONE ctermfg=88 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#14140f guibg=#cccccc gui=NONE ctermfg=232 ctermbg=252 cterm=NONE
hi StatusLineNC guifg=#192224 guibg=#5E6C70 gui=NONE ctermfg=235 ctermbg=66 cterm=bold
hi TabLine guifg=#7a7679 guibg=#252429 gui=NONE ctermfg=243 ctermbg=235 cterm=bold
hi TabLineFill guifg=#192224 guibg=#2f3030 gui=NONE ctermfg=235 ctermbg=236 cterm=bold
hi TabLineSel guifg=#789196 guibg=NONE gui=NONE ctermfg=66 ctermbg=NONE cterm=bold
hi Tag guifg=#BD9800 guibg=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Title guifg=#cccccc guibg=#14140f gui=NONE ctermfg=252 ctermbg=233 cterm=bold
hi Type guifg=#536991 guibg=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
hi Underlined guifg=#F9F9FF guibg=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi VertSplit guifg=#192224 guibg=#5E6C70 gui=NONE ctermfg=235 ctermbg=66 cterm=bold
hi Visual guifg=NONE guibg=#292929 gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
hi VisualNOS guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi WarningMsg guifg=#A1A6A8 guibg=#912C00 gui=NONE ctermfg=248 ctermbg=88 cterm=NONE
hi WildMenu guifg=NONE guibg=#A1A6A8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE

hi link SpecialChar Identifier

hi link IncSearch Search

hi link Boolean Constant
hi link Character Constant
hi link Float Constant
hi link Number Constant
hi link String Constant
hi! link PMenuSel Constant

hi link Conditional Statement
hi link Define Statement
hi link Exception Statement
hi link Include Statement
hi link Keyword Statement
hi link Label Statement
hi link Macro Statement
hi link Operator Statement
hi link PreCondit Statement
hi link Repeat Statement

hi link StorageClass Type
hi link Structure Type
hi link Typedef Type

hi! link DiffText Debug
hi! link Todo Debug

" shell
hi link shDerefSimple Identifier
hi link shDerefVar Identifier

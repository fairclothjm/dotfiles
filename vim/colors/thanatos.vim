" Vim color file - thanatos
"
if version > 580
        hi clear
        if exists("syntax_on")
                syntax reset
        endif
endif

set background=dark
set t_Co=256
let g:colors_name = "thanatos"

hi Normal guifg=#cccccc guibg=#14140f guisp=#14140f gui=NONE ctermfg=252 ctermbg=233 cterm=NONE

hi Comment guifg=#6c6d70 guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
hi Constant guifg=#789196 guibg=NONE guisp=NONE gui=NONE ctermfg=66 ctermbg=NONE cterm=NONE
hi Identifier guifg=#cccccc guibg=NONE guisp=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE

hi Statement guifg=#993333 guibg=NONE guisp=NONE gui=NONE ctermfg=88 ctermbg=NONE cterm=NONE
hi PreProc guifg=#993333 guibg=NONE guisp=NONE gui=NONE ctermfg=88 ctermbg=NONE cterm=NONE

hi Type guifg=#536991 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
hi Special guifg=#cccccc guibg=NONE guisp=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
hi Underlined guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline

hi Error guifg=#A1A6A8 guibg=#912C00 guisp=#912C00 gui=NONE ctermfg=248 ctermbg=88 cterm=NONE
hi ErrorMsg guifg=#A1A6A8 guibg=#4a1701 guisp=#4a1701 gui=NONE ctermfg=248 ctermbg=52 cterm=NONE
hi SpellBad guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline

hi SpecialKey guifg=#5E6C70 guibg=NONE guisp=NONE gui=italic ctermfg=66 ctermbg=NONE cterm=NONE

hi Search guifg=#14140f guibg=#cccccc guisp=#cccccc gui=NONE ctermfg=232 ctermbg=252 cterm=NONE
hi link IncSearch Search

hi ModeMsg guifg=#14140f guibg=#cccccc guisp=#cccccc gui=NONE ctermfg=232 ctermbg=252 cterm=NONE

hi WildMenu guifg=NONE guibg=#A1A6A8 guisp=#A1A6A8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
hi SignColumn guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE ctermfg=235 ctermbg=60 cterm=NONE
hi Title guifg=#b3b3b3 guibg=#252a2b guisp=#252a2b gui=bold ctermfg=249 ctermbg=235 cterm=bold
hi Folded guifg=#192224 guibg=#A1A6A8 guisp=#A1A6A8 gui=italic ctermfg=235 ctermbg=248 cterm=NONE
hi NonText guifg=#5E6C70 guibg=NONE guisp=NONE gui=italic ctermfg=66 ctermbg=NONE cterm=NONE


hi link SpecialChar Identifier
hi SpecialComment guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE

hi DiffText guifg=NONE guibg=#492224 guisp=#492224 gui=NONE ctermfg=NONE ctermbg=52 cterm=NONE

hi Debug guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi! link Todo Debug

hi LineNr guifg=#6b6a6a guibg=#1c1b1c guisp=#1c1b1c gui=NONE ctermfg=242 ctermbg=234 cterm=NONE

hi! link StatusLine Search
hi StatusLineNC guifg=#192224 guibg=#5E6C70 guisp=#5E6C70 gui=bold ctermfg=235 ctermbg=66 cterm=bold

hi Delimiter guifg=#d4d4d4 guibg=NONE guisp=NONE gui=NONE ctermfg=188 ctermbg=NONE cterm=NONE
hi SpellRare guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi TabLineSel guifg=#544251 guibg=#0f0f0f guisp=#0f0f0f gui=bold ctermfg=240 ctermbg=233 cterm=bold

hi link String Constant
hi link Character Constant
hi link Boolean Constant
hi link Float Constant
hi link Number Constant

hi Function guifg=#6490db guibg=NONE guisp=NONE gui=NONE ctermfg=68 ctermbg=NONE cterm=NONE

hi link Conditional Statement
hi link Define Statement
hi link Exception Statement
hi link Include Statement
hi link Keyword Statement
hi link Macro Statement
hi link Operator Statement
hi link PreCondit Statement
hi link Repeat Statement
hi link Label Statement

hi link StorageClass Type
hi link Structure Type
hi link Typedef Type

hi Cursor guifg=#192224 guibg=#b3b3b3 guisp=#b3b3b3 gui=NONE ctermfg=235 ctermbg=249 cterm=NONE
hi CursorLine guifg=NONE guibg=#1f1f1f guisp=#1f1f1f gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
hi CursorLineNr guifg=#e0e0e0 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi CursorIm guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE ctermfg=235 ctermbg=60 cterm=NONE
hi CursorColumn guifg=NONE guibg=#222E30 guisp=#222E30 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE

hi ColorColumn guifg=NONE guibg=#1f1f1f guisp=#1f1f1f gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE

hi TabLineFill guifg=#192224 guibg=#2f3030 guisp=#2f3030 gui=bold ctermfg=235 ctermbg=236 cterm=bold
hi WarningMsg guifg=#A1A6A8 guibg=#912C00 guisp=#912C00 gui=NONE ctermfg=248 ctermbg=88 cterm=NONE
hi DiffDelete guifg=NONE guibg=#192224 guisp=#192224 gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
hi FoldColumn guifg=#192224 guibg=#A1A6A8 guisp=#A1A6A8 gui=italic ctermfg=235 ctermbg=248 cterm=NONE

hi Visual guifg=#14140f guibg=#cccccc guisp=#cccccc gui=NONE ctermfg=232 ctermbg=252 cterm=NONE
hi VisualNOS guifg=#192224 guibg=#F9F9FF guisp=#F9F9FF gui=underline ctermfg=235 ctermbg=189 cterm=underline

hi MoreMsg guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold
hi SpellCap guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi VertSplit guifg=#192224 guibg=#5E6C70 guisp=#5E6C70 gui=bold ctermfg=235 ctermbg=66 cterm=bold
hi DiffChange guifg=NONE guibg=#492224 guisp=#492224 gui=NONE ctermfg=NONE ctermbg=52 cterm=NONE
hi SpellLocal guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Tag guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE

hi PMenu guifg=#c2c2c2 guibg=#252429 guisp=#252429 gui=NONE ctermfg=7 ctermbg=235 cterm=NONE
hi PMenuThumb guifg=NONE guibg=#a4a6a8 guisp=#a4a6a8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
hi PMenuSbar guifg=NONE guibg=#848688 guisp=#848688 gui=NONE ctermfg=NONE ctermbg=102 cterm=NONE
hi PMenuSel guifg=#754b6e guibg=#141412 guisp=#141412 gui=NONE ctermfg=96 ctermbg=233 cterm=NONE

hi MatchParen guifg=#131314 guibg=#a39ea3 guisp=#a39ea3 gui=bold ctermfg=233 ctermbg=248 cterm=bold
hi LocalVariable guifg=#f0f0f0 guibg=NONE guisp=NONE gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi CTagsClass guifg=#2459e0 guibg=NONE guisp=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi Directory guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold
hi DiffAdd guifg=NONE guibg=#193224 guisp=#193224 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi TabLine guifg=#7a7679 guibg=#252429 guisp=#252429 gui=bold ctermfg=243 ctermbg=235 cterm=bold

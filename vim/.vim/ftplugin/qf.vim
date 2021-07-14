" settings for the quickfix window

setlocal wrap
setlocal colorcolumn=

" adjust quickfix window height automatically
augroup quickfix
    autocmd!
    exe max([min([line("$"), 10]), 3]) . "wincmd _"

    " push quickfix window to the bottom
    " https://github.com/fatih/vim-go/issues/108
    wincmd J
augroup END

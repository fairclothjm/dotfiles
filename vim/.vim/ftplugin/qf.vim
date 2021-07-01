" settings for the quickfix window

setlocal wrap
setlocal colorcolumn=

" adjust quickfix window height automatically
augroup quickfix
    autocmd!
    exe max([min([line("$"), 10]), 3]) . "wincmd _"
augroup END

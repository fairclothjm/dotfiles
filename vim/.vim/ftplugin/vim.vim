" settings for vimscript

set sw=2

" Automatically source .vimrc on save
augroup Vimrc
    autocmd!
    autocmd! bufwritepost .vimrc source %
augroup END

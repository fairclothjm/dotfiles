" settings for vimscript
set sw=2

" Automatically source .vimrc on save
augroup Vimrc
    autocmd!
    autocmd! BufWritePost .vimrc source %
augroup END

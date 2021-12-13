" settings for vimscript

" Automatically source .vimrc on save
augroup Vimrc
    autocmd!
    autocmd! BufWritePost .vimrc source $MYVIMRC
augroup END

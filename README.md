# dotfiles

Manage dotfile symlinks using [GNU Stow](A place for my dotfiles to live).

Sync with the home directory:
```
stow -t ~ bash git vim
```

Then install Vundle for vim package management:
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

TODO: use something other than Vundle.

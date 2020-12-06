# dotfiles

Manage dotfile symlinks using [GNU Stow](https://www.gnu.org/software/stow/).

Sync with the home directory:
```
stow -t ~ bash git vim
```

Then install vim-plug:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```


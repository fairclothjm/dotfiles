# dotfiles

Manage dotfile symlinks using [GNU Stow](https://www.gnu.org/software/stow/).

## initial setup

Sync with the home directory:
```
stow --target ~ bash git vim
```

Then install custom executables and vim-plug:
```
./install.sh
```

## refresh setup

The following command can be used to refresh the stowed files. For example, it
is useful for when a new "dotfile" is added.

```
stow --restow --target ~ bash git vim
```

#!/usr/bin/env bash

# download vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# clone bin repo for custom executables and git commands
git clone git@github.com:fairclothjm/bin.git ~/bin

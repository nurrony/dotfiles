#!/usr/bin/env bash

# Using Jess Frazelle's Vim configuration for now. I will add and customise
# if necessary. A warm thanks to Jess Frazelle

cd ~/
git clone --recursive https://github.com/jessfraz/.vim.git .vim
ln -sf $HOME/.vim/vimrc $HOME/.vimrc
cd $HOME/.vim
git submodule update --init

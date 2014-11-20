#!/bin/sh

mkdir -p ~/vim-config/bundle
git clone https://github.com/Shougo/neobundle.vim ~/vim-config/bundle/neobundle.vim

ln -s ~/vim-config/vimrc $HOME/.vimrc
ln -s ~/vim-config/ $HOME/.vim

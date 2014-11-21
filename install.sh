#!/bin/sh

if [ ! -e ~/vim-config/bundle/neobundle.vim ]; then
  mkdir -p ~/vim-config/bundle
  git clone https://github.com/Shougo/neobundle.vim ~/vim-config/bundle/neobundle.vim
fi

if [ -e ~/.vimrc ] || [ -e ~/.vim ]; then
  echo "Symlinks cannot be created."
  exit 1
fi

ln -s ~/vim-config/vimrc ~/.vimrc
ln -s ~/vim-config/ ~/.vim

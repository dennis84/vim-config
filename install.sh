#!/bin/sh

if [ ! -e ~/vim-config/bundle/neobundle.vim ]; then
  mkdir -p ~/vim-config/bundle
  git clone https://github.com/Shougo/neobundle.vim ~/vim-config/bundle/neobundle.vim
fi

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

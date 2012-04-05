#!/bin/zsh

my_vim_path="$HOME/vim-config"

rm -rf $my_vim_path/bundle/*

git clone https://github.com/gmarik/vundle.git bundle/vundle

rm $HOME/.vimrc
rm $HOME/.vim

ln -s $my_vim_path/vimrc $HOME/.vimrc
ln -s $my_vim_path/ $HOME/.vim


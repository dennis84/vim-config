#!/bin/sh

script_path="$(cd "$(dirname "$0")"; pwd -P)"

if [ ! -e "$script_path/autoload/plug.vim" ]; then
  curl -fLo "$script_path/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

mkdir -p ~/.config

ln -s "$script_path" ~/.config/nvim

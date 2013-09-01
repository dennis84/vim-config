#!/bin/sh

# Define the plugin path.
my_vim_path="$HOME/vim-config"

# Remove all bundles. You must install them with the vundle plugin.
# In Vim: :BundleInstall
rm -rf $my_vim_path/bundle/*

git clone https://github.com/gmarik/vundle.git bundle/vundle

# Removes the original vim files. Warning dont run the install script and try
# this config, all your data will get lost.
rm $HOME/.vimrc
rm $HOME/.vim

# Make a softlink for .vimrc and vim dir to vim-config  
ln -s $my_vim_path/vimrc $HOME/.vimrc
ln -s $my_vim_path/ $HOME/.vim

# Make the scariform script executable
chmod u+x $HOME/vim-config/bin/scalariform


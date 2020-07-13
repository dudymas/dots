#!/bin/zsh

# VIM
BUNDLE_DIR=$HOME/.vim/bundle
SCRIPT_DIR=$(dirname $0)

mkdir -p $BUNDLE_DIR
git clone https://github.com/gmarik/Vundle.vim.git $BUNDLE_DIR/Vundle.vim

vim -s $SCRIPT_DIR/vim_setup.vim
cd $BUNDLE_DIR/tern_for_vim
npm install

cd $BUNDLE_DIR/YouCompleteMe
$PACKAGE_MANAGER $ADD_PACKAGE_COMMAND python python-dev build-base perl cmake
git submodule update --init --recursive
./install.py
$PACKAGE_MANAGER $REM_PACKAGE_COMMAND python-dev build-base perl cmake

# ZSH
ghq get pindexis/marker
echo "to enable marker, ghq look marker && ./install.py"


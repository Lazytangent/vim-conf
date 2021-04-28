#!/bin/sh
set -e

if [ -f ~/.vimrc ]; then
  cp ~/.vimrc ~/.vimrc.pre
fi

cp ~/.vim_conf/.vimrc ~/.vimrc
echo "Installed successfully"

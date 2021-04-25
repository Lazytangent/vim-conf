#!/bin/sh
set -e

cp ~/.vimrc > ~/.vimrc.pre

cp ~/.vim_conf/.vimrc > ~/.vimrc
echo "Installed successfully"

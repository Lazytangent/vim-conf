#!/bin/sh
set -e

cat ~/.vimrc > ~/.vimrc.pre

cat ~/.vim_conf/.vimrc > ~/.vimrc
echo "Installed successfully"

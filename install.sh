#!/bin/sh
set -e

try
  cat ~/.vimrc > ~/.vimrc.pre
catch
endtry

cat ~/.vim_conf/.vimrc > ~/.vimrc
echo "Installed successfully"

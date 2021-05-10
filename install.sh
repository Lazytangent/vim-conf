#!/bin/bash

set -e

cp ~/.vimrc ~/.vimrc_backup
echo 'source ~/.vim_conf/.vimrc' > ~/.vimrc
echo 'Done!'

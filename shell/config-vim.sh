#!/usr/bin/env bash

set -e

if [ -d .vim ]; then
	rm -rf .vim;
fi

mkdir .vim
mkdir .vim/plugin

echo -e "augroup vagrant\n\tau!\n\tau BufRead,BufNewFile Vagrantfile set filetype=ruby\naugroup END" >> .vim/plugin/vagrant.vim

git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/Vundle.vim

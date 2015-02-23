#!/usr/bin/env bash

set -e

if [ -d .vim ]; then
	rm -rf .vim;
fi

mkdir .vim
mkdir .vim/plugin

echo -e "augroup vagrant\n\tau!\n\tau BufRead,BufNewFile Vagrantfile set filetype=ruby\naugroup END" >> .vim/plugin/vagrant.vim

echo -e "set nocompatible\nfiletype off\n\nset rtp+=~/.vim/bundle/Vundle.vim\ncall vundle#begin()\n\nPlugin 'gmarik/Vundle.vim'\nPlugin 'scrooloose/nerdtree.git'\n\nPlugin 'pangloss/vim-javascript'\nPlugin 'nathanaelkane/vim-indent-guides'\nPlugin 'Raimond/delimiteMate'\n\ncall vundle#end()\n\nfiletype plugin indent on\nsyntax on\n\nset tabstop=2\nset softtabstop=2\nset shiftwidth=2\nset noexpandtab\n\nset noeb vb t_vb=\nau GUIEnter * set vb t_vb=\n\nimap <C-c> <CR><Esc>0"

git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/Vundle.vim
git clone https://github.com/scrooloose/nerdtree.git .vim/bundle/nerdtree

vim +PluginInstall +qall

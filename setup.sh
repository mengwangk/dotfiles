#!/usr/bin/env bash

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# powerline plugin
pip install powerline-status

# prettier plugin
yarn global add prettier



#!/usr/bin/env bash

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Symlinks using GNU stow
stow -v vim -t ~/
stow -v tmux -t ~/
stow -v zsh -t ~/
stow -v alacritty -t ~/


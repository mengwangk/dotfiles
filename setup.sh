#!/usr/bin/env bash

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Symlinks using GNU stow
stow -v vim -t ~/
stow -v tmux -t ~/
stow -v zsh -t ~/
stow -v alacritty -t ~/
stow -v ranger -t ~/.config/ranger
stow -v yabai -t ~/
stow -v skhd -t ~/
stow -v kitty -t ~/.config/kitty
stow -v fish -t ~/.config
stow -v emacs -t ~/.emacs.d
stow -v lf -t ~/.config/lf
stow -v vifm -t ~/.config/vifm

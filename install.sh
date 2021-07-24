
yay_install() {
  yay -S fakeroot tree-sitter stow binutils neovim-nightly-bin ttf-fira-code nerd-fonts-fira-code gcc make nodejs npm brave-bin google-chrome
}

pip_install(){
  # Install miniconda first
  pip install pynvim
}

lsp_install(){
  sudo npm i -g pyright
}

# yay_install

# pip_install

lsp_install


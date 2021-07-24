zsh_install() {
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

miniconda_install() {
  # Install miniconda
}

p10k_install() {
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

yay_install() {
  yay -S fakeroot tree-sitter stow binutils neovim-nightly-bin ttf-fira-code nerd-fonts-fira-code gcc make nodejs npm brave-bin google-chrome wezterm shfmt
}

pip_install() {
  # Install miniconda first
  pip install pynvim
}

lsp_install() {
  sudo npm i -g pyright
}

# yay_install

# pip_install

# lsp_install

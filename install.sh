zsh_install() {
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

miniconda_install() {
  echo "Install miniconda" 
}

p10k_install() {
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

yay_install() {
  yay -S fakeroot tree-sitter stow binutils neovim-nightly-bin ttf-fira-code nerd-fonts-fira-code gcc make nodejs npm brave-bin google-chrome wezterm shfmt peek screenkey ripgrep fd unzip cmake flameshot neofetch ninja tldr tealdeer pet sway broot mcfly git-delta diff-so-fancy lldb visual-studio-code-bin aria2 watchman-bin xclip xsel lazygit ueberzug neovide-git ffmpegthumbnailer github-cli waybar alacritty tmux dmenu xorg-server-xwayland xmodmap vale-bin git-delta picom i3 polybar
}

sway_install(){
  yay -S wl-clipboard waybar mako mpd mpv ncmpcpp pavucontrol ranger rofi swaylock maim nnn grim slurp alacritty grim slurp acpilight xorg-xrandr swayidle
}

pip_install() {
  # Install miniconda first
  pip install pynvim pyfunky csvkit jupyter jupyterlab setuptools pyre_check wheel fb-sapp black flake8 isort ranger-fm neovim-remote
}

npm_install() {
  sudo npm i -g pyright typescript  typescript-language-server vim-language-server nodemon yarn write-good prettier eslint pnpm @mermaid-js/mermaid-cli
}

jump_install(){
  sudo pacman -S zoxide
}

fzf_install(){
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

git_config() {
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
  git config --global interactive.diffFilter "diff-so-fancy --patch"
}

golang_install(){
  wget https://golang.org/dl/go1.16.6.linux-amd64.tar.gz
  sudo mkdir -p /usr/local/go && sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.16.6.linux-amd64.tar.gz
  # TODO - set the path
}

rust_install(){
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  cargo install stylua
}

gopls_install(){
  GO111MODULE=on go get golang.org/x/tools/gopls@latest
}

rustanalyzer_install(){
  git clone https://github.com/rust-analyzer/rust-analyzer.git && cd rust-analyzer
  cargo xtask install --server
}

conventional_commit(){
  sudo npm install -g commitizen
  sudo npm install -g cz-conventional-changelog
  echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc
}

conda_install(){
  conda install -c conda-forge xorg-libxext
  conda install -c conda-forge xorg-libx11
}

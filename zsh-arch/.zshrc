# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/alpha2phi/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git asdf)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

export EDITOR='nvim'

alias v='nvim'

set -o vi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/alpha2phi/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/alpha2phi/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/alpha2phi/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/alpha2phi/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh --cmd j)"

alias luamake=/home/alpha2phi/workspace/software/lua-language-server/3rd/luamake/luamake

function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
# stty -ixon
bindkey '^s' pet-select

# source /home/alpha2phi/.config/broot/launcher/bash/br

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Rust
source $HOME/.cargo/env

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

alias c='clear'
alias b='echo -e "enter brightness:\n"; read val; xrandr  --output XWAYLAND0 --brightness "${val}"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/workspace/software/flutter/bin:$PATH"

export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export ANDROID_AVD_HOME="$HOME/Android/Sdk/platform-tools"

export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# fnm
export PATH=/home/alpha2phi/.fnm:$PATH
eval "`fnm env`"

export PATH="$HOME/.poetry/bin:$PATH"

NVIM_BEGINNER=~/.config/nvim-beginner
export NVIM_BEGINNER
alias nvb='XDG_DATA_HOME=$NVIM_BEGINNER/share XDG_CACHE_HOME=$NVIM_BEGINNER XDG_CONFIG_HOME=$NVIM_BEGINNER nvim'

MNV_APP_NAME=modern-neovim
alias mnv="NVIM_APPNAME=$MNV_APP_NAME nvim"

export PATH=$PATH:$NVIM_BEGINNER/share/nvim/mason/packages/lua-language-server
export PATH=$PATH:$NVIM_BEGINNER/share/nvim/mason/packages/codelldb/

# eval "$(starship init zsh)"

# bun completions
[ -s "/home/alpha2phi/.bun/_bun" ] && source "/home/alpha2phi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH:$HOME/.sdkman/candidates/java/current/bin"

# Neovim version manager
export PATH=$HOME/.local/share/bob/nvim-bin/:$PATH
export PATH=$HOME/.local/share/coursier/bin:$PATH

export OPENAI_API_KEY=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
export OPENAI_API_HOST="api.openai.com"
export HUGGING_FACE_HUB_TOKEN=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
export ALPHA_VANTAGE_API_KEY=GA2WSW54TTCDFWD6
export COQUI_STUDIO_TOKEN=2qYiMFvcKO8JCCjKEgEx0ygh1ca6hjAYZFjITlsNUkYOMCpUsnKuMGCmGequE9Hh

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# Map Control and Window keys to ESC when pressed on its own
xcape -e 'Control_L=Escape'
xcape -e 'Super_L=Escape' -t 300_

# pnpm
export PNPM_HOME="/home/alpha2phi/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

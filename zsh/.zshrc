export SOFTWARE=$HOME/workspace/software
export PATH=$PATH:$SOFTWARE

export GOPATH=$HOME/workspace/development/go-lang
export PATH=$GOPATH/bin:$PATH

export CPATH=/Library/Developer/CommandLineTools/usr/include/c++/v1
export CGO_ENABLED=1; export CC=gcc;
export PROMPT='%B%F{240}%1~%f%b %# '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mengwangk/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mengwangk/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mengwangk/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mengwangk/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

FLUTTER_HOME=$HOME/workspace/software/flutter
export PATH=$PATH:$FLUTTER_HOME/bin

RUST_HOME=$HOME/.cargo
export PATH=$PATH:$RUST_HOME/bin

set -o vi
bindkey -v
bindkey '^R' history-incremental-search-backward

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# # Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

# # To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

PROMPT='%F{green}%1~%f %# '
autoload -U colors && colors

alias ls='ls --color=auto'
alias ll='ls -l'

# key binding; namely caps lock -> esc
xmodmap ~/.Xmodmap

# turn on numlock
/usr/bin/numlockx on

# rust
source $HOME/.cargo/env
export RUST_SRC_PATH=/home/mike/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library
export OPENSSL_INCLUDE_DIR=/usr/include/openssl
export OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu

# go
export PATH=$PATH:/usr/local/go/bin

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# https://github.com/zsh-users/zsh-syntax-highlighting
# Load zsh-syntax-highlighting; should be last.
source /home/mike/Downloads/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

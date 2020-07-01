autoload -U colors && colors

alias ls='ls --color=auto'
alias ll='ls -ltr'

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
#HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# https://github.com/zsh-users/zsh-syntax-highlighting
# Load zsh-syntax-highlighting; should be last.
source /home/mike/Downloads/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

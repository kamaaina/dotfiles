# do not show a message when launching fish
set fish_greeting

# key binding; namely caps lock -> esc
xmodmap ~/.Xmodmap

# # turn on numlock
/usr/bin/numlockx on

alias ll="exa -l -g --icons"
alias ltr="exa -l -s modified"
alias ltra="exa -la -s modified"
alias ls=exa
alias vim=nvim

# rust
source $HOME/.cargo/env
set -x RUST_SRC_PATH $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library
set -x OPENSSL_INCLUDE_DIR /usr/include/openssl
set -x OPENSSL_LIB_DIR /usr/lib/x86_64-linux-gnu

# path
fish_add_path /usr/local/go/bin


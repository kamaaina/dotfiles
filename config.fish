# do not show a message when launching fish
set fish_greeting

# key binding; namely caps lock -> esc
xmodmap ~/.Xmodmap

# # turn on numlock
/usr/bin/numlockx on

#alias ll="exa -l -g --icons"
#alias ltr="exa -l -s modified --icons"
#alias ltra="exa -la -s modified --icons"
#alias ls=exa
alias ls=lsd
alias vim=nvim
alias cal="ncal -b"

# rust
#source $HOME/.cargo/env
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -x RUST_SRC_PATH $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library
set -x OPENSSL_INCLUDE_DIR /usr/include/openssl
set -x OPENSSL_LIB_DIR /usr/lib/x86_64-linux-gnu

# path
fish_add_path /usr/local/go/bin


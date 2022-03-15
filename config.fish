# do not show a message when launching fish
set fish_greeting

# key binding; namely caps lock -> esc
xmodmap ~/.Xmodmap

# turn on numlock
/usr/bin/numlockx on

alias ls=lsd
alias vim=nvim
#alias cal="ncal -b"
alias tg="flatpak run org.telegram.desktop &> /dev/null &; disown"
alias office="flatpak run org.onlyoffice.desktopeditors &> /dev/null &; disown"

# rust
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -x RUST_SRC_PATH $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library

# path
fish_add_path /usr/local/go/bin


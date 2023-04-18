# do not show a message when launching fish
set fish_greeting

# key binding; namely caps lock -> esc
#xmodmap ~/.Xmodmap

# turn on numlock
#/usr/bin/numlockx on

alias ls=lsd
alias vim=nvim
alias lg=lazygit
#alias cal="ncal -b"
alias tg="flatpak run org.telegram.desktop &> /dev/null &; disown"
alias office="flatpak run org.onlyoffice.desktopeditors &> /dev/null &; disown"
alias vscode="flatpak run com.visualstudio.code &> /dev/null &; disown"
alias yubi="com.yubico.yubioath &> /dev/null &; disown"
alias emacs="emacsclient -c -a 'emacs'"
alias r=ranger

# rust
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -x RUST_SRC_PATH $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library

# emacs
set -x TMP /tmp

# path
fish_add_path /usr/local/go/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.emacs.d/bin

set -x EDITOR vim

# starship prompt
# install starship with:
# curl -sS https://starship.rs/install.sh | sh
#starship init fish | source

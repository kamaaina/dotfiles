# do not show a message when launching fish
set fish_greeting

# key binding; namely caps lock -> esc
#xmodmap ~/.Xmodmap

# turn on numlock
#/usr/bin/numlockx on

#alias ls=lsd
alias ls=eza
alias ll="ls -lg"
#alias ltr="ls -lg --sort=time"
alias vim=nvim
alias lg=lazygit
#alias cal="ncal -b"
alias tg="flatpak run org.telegram.desktop &> /dev/null &; disown"
alias office="flatpak run org.onlyoffice.desktopeditors &> /dev/null &; disown"
alias vscode="flatpak run com.visualstudio.code &> /dev/null &; disown"
alias yubi="flatpak run com.yubico.yubioath &> /dev/null &; disown"
alias emacs="emacsclient -c -a 'emacs'"
alias r=ranger
abbr d cd ~/devel
abbr gs git status
abbr gp git pull
abbr ltr ls -lg --sort=time
abbr ltrS ls -lg --sort=size

# rust
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -x RUST_SRC_PATH $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library

# emacs
set -x TMP /tmp

# path
fish_add_path /usr/local/go/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.config/emacs/bin

set -x EDITOR vim

# starship prompt
# install starship with:
# curl -sS https://starship.rs/install.sh | sh
#starship init fish | source

# colors
set -x LS_COLORS 'di=0;94:ex=0;92:ln=36:ow=0;30;42'

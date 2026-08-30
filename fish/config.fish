source /usr/share/cachyos-fish-config/cachyos-config.fish

# do not show a message when launching fish
function fish_greeting
end

alias ls=eza
alias ll="ls --icons -lg"
alias vim=nvim
alias lg=lazygit
alias gl="git log --pretty=format:'%C(yellow)%h %Cred%ad %Creset%s' --date=short"
#alias cal="ncal -b"
#alias office="flatpak run org.onlyoffice.desktopeditors &> /dev/null &; disown"
alias emacs="emacsclient -c -a 'doom-emacs'"
alias cat="bat --paging=never"
abbr d cd ~/devel
abbr gs git status
abbr gp git pull
abbr ltr ls -lg --sort=time
abbr ltrS ls -lg --sort=size
abbr lock swaylock -c 000000

# dark mode
set -x GTK_THEME Adwaita:dark

# emacs
set -x TMP /tmp

# path
fish_add_path $HOME/.config/emacs/bin
fish_add_path $HOME/go/bin
fish_add_path /opt/zig-x86_64-linux-0.16.0

set -x EDITOR vim

# colors
set -x LS_COLORS 'di=0;94:ex=0;92:ln=36:ow=0;30;42'

# keep the text on screen after quitting bat
set -x BAT_PAGER "less -XR"

zoxide init --cmd cd fish | source

#!/bin/sh

# each theme has an up and down file which is a script to start/stop processes
# add this script to the up script in the specified theme. for example
# in .config/leftwm/themes/candy/up, add the following line
# $HOME/.config/leftwm/mine.sh

# keyboard repeat rate
xset r rate 400 50

# change mouse to left handed mouse
#xmodmap -e "pointer = 3 2 1"

# start emacs daemon
/usr/bin/emacs --daemon &

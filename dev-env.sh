#!/bin/sh

SESSION=mike
echo "creating session '${SESSION}'"

tmux new-session -s $SESSION -d -n code -c ~/devel fish
tmux set-option -g monitor-activity off
tmux new-window -t $SESSION -d -n compile -c ~/devel fish
tmux new-window -t $SESSION -d -n home -c ~/ fish
tmux select-window -t code
tmux set-hook client-attached 'run -C -d 3 "set-option -g monitor-activity on"'
tmux -2 attach-session -t $SESSION -d


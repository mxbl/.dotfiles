#!/bin/bash
# .tmux-right-status.sh
# ---
# Echo tmux right status prompt depending on clients window size.

WIDTH=$(tmux display -p "#{client_width}")
SMALL=80
MEDIUM=120

if [ "$WIDTH" -gt "$MEDIUM" ]
then
  echo -n ":#{client_pid}:#{socket_path}:#{pane_current_path}"
elif [ "$WIDTH" -gt "$SMALL" ]
then
  echo -n "#{pane_current_path}"
fi

# return nothing if the client window is below `SMALL` columns

#vim:ft=bash

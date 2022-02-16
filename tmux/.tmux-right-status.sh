#!/bin/bash
# .tmux-right-status.sh
# ---
# Echo tmux right status prompt depending on clients window size.

WIDTH=$(tmux display -p "#{client_width}")
SMALL=80
MEDIUM=120

# Colors
PURPLE="#[fg=colour141]"
NORMAL="#[fg=#888888]"

if [ "$WIDTH" -gt "$MEDIUM" ]
then
  # client pid
  echo -n ":$PURPLE#{client_pid}$NORMAL"
  # socket path
  echo -n ":#{socket_path}:"
  # pane current path
  echo -n "#[fg=colour116]#{pane_current_path}"
elif [ "$WIDTH" -gt "$SMALL" ]
then
  # pane current path
  echo -n "#[fg=colour116]#{pane_current_path}"
fi

# return nothing if the client window is below `SMALL` columns

#vim:ft=bash

#!/usr/bin/env bash

[[ -z "$TMUX_PANE" ]] && exit


colors=(17 22 35 66)

c=${colors[$RANDOM % ${#colors[@]}]}

current=$(tmux select-pane -g -t "$TMUX_PANE")

tmux select-pane -P "bg=colour$c" -t "$TMUX_PANE"

( while kill -0 "$PPID" 2> /dev/null; do sleep 1; done
  tmux select-pane -P "$current" -t "$TMUX_PANE" ) &

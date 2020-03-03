#!/usr/bin/env bash

[[ -z "$TMUX_PANE" ]] && exit


colors=(
    12 17 18 22 23 24 34 35 36 37 38 39 52 53
    54 55 56 57 66 67 68 71 72 73 74
)

c=${colors[$RANDOM % ${#colors[@]}]}

current=$(tmux select-pane -g -t "$TMUX_PANE")

tmux select-pane -P "bg=colour$c" -t "$TMUX_PANE"

( while kill -0 "$PPID" 2> /dev/null; do sleep 1; done
  tmux select-pane -P "$current" -t "$TMUX_PANE" ) &

#!/usr/bin/env bash

[[ -z "$TMUX_PANE" ]] || [[ "$#" -ne 1 ]] && exit


c="$1"

current=$(tmux select-pane -g -t "$TMUX_PANE")

tmux select-pane -P "bg=$c" -t "$TMUX_PANE"

( while kill -0 "$PPID" 2> /dev/null; do sleep 1; done
  tmux select-pane -P "$current" -t "$TMUX_PANE" ) &

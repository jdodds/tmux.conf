#!/usr/bin/env bash

[[ -z "$TMUX_PANE" ]] && exit

anywait() {
    for pid in "$@"; do
        while kill -0 "$pid"; do
            sleep 0.5
        done
    done
}


colors=(
    12 17 18 22 23 24 34 35 36 37 38 39 52 53
    54 55 56 57 66 67 68 71 72 73 74
)

c=${colors[$RANDOM % ${#colors[@]}]}

tmux select-pane -P "bg=colour$c" -t "$TMUX_PANE"

( anywait "$PPID"
  tmux select-pane -P "$current" -t "$TMUX_PANE" ) &


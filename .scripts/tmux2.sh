#!/usr/bin/env bash

# will fail script if it fails
set -e
# this let's you know early if something fails
set -o pipefail

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=`fd -d 1 . "${HOME}/Projects"|fzf`
fi
session=`basename $selected`

if ! tmux has-session -t $session &>/dev/null; then
  tmux new-session -c $selected -d -s $session && tmux switch-client -t $session || tmux new -c $selected -A -s $session
else
  tmux switch-client -t $session
fi

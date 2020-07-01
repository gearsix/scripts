#!/bin/sh
# git-tmux
# description: a tmux window i find myself creating often for git repositores, decided to throw it into a script
# dependencies: tmux, git, while-true

tmux new-session -d
tmux split-window -h "while-true 'git --no-pager branch -v'"
tmux split-window -v "while-true 'git status'"
tmux split-window -h "while-true 'git --no-pager log --graph --abbrev-commit -n 1'"
tmux select-layout main-vertical
tmux -2 attach-session -d

#!/bin/sh
session="main" # set up tmux tmux start-server
SESSIONEXISTS=$(tmux list-sessions | grep $session)

if [ "$SESSIONEXISTS" = "" ]
then
  # create a new tmux session, starting a new vim session
  tmux new-session -d -s $session -n vim
  tmux send-keys "v" C-m

  tmux new-window -n 'shell'
  tmux splitw -h -p 35
   # Select pane 2
  tmux selectp -t 2
  tmux send-keys "cal" C-m
  # Split pane 2 vertiacally by 25%
  tmux splitw -v -p 75
  tmux selectp -t 3
  tmux send-keys "weatherlong" C-m
  tmux selectp -t 1
  tmux send-keys "cd ~/Documents/Code" C-m

  # return to main vim window
  tmux select-window -t 'vim'

  # Finished setup, attach to the tmux session!
  tmux attach-session -t $session
fi


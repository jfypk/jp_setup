#!/bin/sh
session="main" # set up tmux tmux start-server
SESSIONEXISTS=$(tmux list-sessions | grep $session)

if [ "$SESSIONEXISTS" = "" ]
then
  # create a new tmux session, starting a new vim session
  tmux new-session -d -s $session -n editor
  tmux send-keys "v" C-m
  tmux splitw -v -p 15
  tmux splitw -h -p 50

  tmux new-window -n 'git & tasks'
  # tmux send-keys "cd ~/Documents/Code" C-m
  tmux splitw -h -p 50
   # Select pane 2
  # tmux selectp -t 2
  # tmux send-keys "~/.jp_setup/taskwarrior/taskwarrior-tui" C-m \;
  # tmux selectp -t 1

  tmux new-window -n 'shell'

  # return to main vim window
  tmux select-window -t 'editor'
  tmux selectp -t 1

  # Finished setup, attach to the tmux session!
  tmux attach-session -t $session
fi

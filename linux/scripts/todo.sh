#!/usr/bin/env bash

if (pgrep -f '/home/dylan/Documents/Notes/todo.vim' >/dev/null) then
  # todo.vim is running
  wid=$(wmctrl -lp | grep -iE 'documents/notes.*nvim' | awk '{print $1;}')
  notes_ws=$(wmctrl -lp | grep -iE 'documents/notes.*nvim' | awk '{print $2;}')
  pid=$(wmctrl -lp | grep -iE 'documents/notes.*nvim' | awk '{print $3;}')
  curr_ws=$(wmctrl -d | grep '*' | cut -d ' ' -f1)
  if [ $curr_ws == $notes_ws ]; then
    cmd="kill -9 ${pid}"
  else
    cmd="wmctrl -ir ${wid} -t ${curr_ws}"
  fi
else
  # todo.vim is not running
  cmd="alacritty -e nvim -S '/home/dylan/Documents/Notes/todo.vim'"
fi

eval $cmd

#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

imwheel -b '4 5'
xset r rate 200 25
xset s off
xset -dpms
xset s noblank

run alacritty --working-directory ~/Documents/ -e vim todo.txt
run quodlibet
run discord

#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

xset r rate 270 33
xset s off
xset -dpms
xset s noblank
imwheel -b '4 5'
picom -b

run alacritty --working-directory ~/Documents/ -e nvim todo.txt
run quodlibet
run discord

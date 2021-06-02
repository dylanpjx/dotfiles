#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

xset r rate 210 30
xset s off
xset -dpms
xset s noblank
xsetwacom set "HUION Huion Tablet stylus" MapToOutput HEAD-0
imwheel -b '4 5'
picom -b
ibus-daemon -drx

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

# run alacritty --working-directory ~/Documents/ -e nvim todo.txt
run discord
run quodlibet 

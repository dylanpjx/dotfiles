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

run quodlibet
run discord
alacritty -t joplin -e joplin

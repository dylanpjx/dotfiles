#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

xset r rate 250 30

# Screen never sleep
xset s off
xset -dpms
xset s noblank

# Swap caps lock and ctrl
xmodmap ~/.xmodmap

xsetwacom set "HUION Huion Tablet stylus" MapToOutput HEAD-0

imwheel -b '4 5'
picom -b
ibus-daemon -drx

run quodlibet
run discord
run alacritty -t joplin -e joplin

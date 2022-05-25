#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# Screen never sleep
xset s off
xset -dpms
xset s noblank

run xsetwacom set "HUION Huion Tablet stylus" MapToOutput HEAD-0

run nitrogen --restore &
run imwheel -b '4 5'
run picom -b

run quodlibet
run discord
run ibus-daemon -drxR
run alacritty

xset r rate 250 30

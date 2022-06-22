#!/usr/bin/env bash
function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom -b
run ibus-daemon -drxR
run imwheel -b '4 5'

run quodlibet
run discord
run alacritty

sleep 3
xset s off
xset -dpms
xset s noblank
xset r rate 250 30

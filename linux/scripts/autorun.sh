#!/usr/bin/env bash
function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom -b
run imwheel -b '4 5'

run quodlibet
run discord
run alacritty

sleep 3
run ibus-daemon -drxR
xset s off
xset -dpms
xset s noblank
xset r rate 250 30

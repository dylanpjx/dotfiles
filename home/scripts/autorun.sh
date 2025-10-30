#!/usr/bin/env bash
function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run nitrogen --restore
# Apps
run firefox
run quodlibet
# run discord --disable-gpu
# Tray
run nm-applet

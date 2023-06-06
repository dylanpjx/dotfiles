#!/usr/bin/env bash
function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run nitrogen --restore
run volumeicon
run nm-applet
run firefox
run quodlibet
run discord --disable-gpu
run /usr/bin/emacs --daemon

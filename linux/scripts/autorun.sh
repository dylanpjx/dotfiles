#!/usr/bin/env bash
function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run firefox
run quodlibet
run discord
run alacritty -e tmux

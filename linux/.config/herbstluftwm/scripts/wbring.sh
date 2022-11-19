#!/usr/bin/env bash

hc() { ${herbstclient_command:-herbstclient} "$@" ;}
currtag=$(hc attr tags.focus.index)
# id=$(wmctrl -l | grep -v " $currtag "| rofi -dmenu -i -p "Bring" | awk '{ print $1 ; }')
id=$(wmctrl -l | rofi -dmenu -i -p "Bring" | awk '{ print $1 ; }')
hc bring ${id}

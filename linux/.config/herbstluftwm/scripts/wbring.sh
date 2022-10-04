#!/usr/bin/env bash

hc() { ${herbstclient_command:-herbstclient} "$@" ;}
id=$(wmctrl -l | rofi -dmenu -i -p "Bring" | awk '{ print $1 ; }')
hc bring ${id}

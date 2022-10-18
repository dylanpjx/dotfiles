#!/usr/bin/env bash

hc() { ${herbstclient_command:-herbstclient} "$@" ;}
currtag=$(hc attr tags.focus | grep "\sindex"  | tr -dc '0-9')
id=$(wmctrl -l | rofi -dmenu -i -p "Bring" | awk '{ print $1 ; }')
hc bring ${id}

#!/usr/bin/env bash

hc() { "${herbstclient_command[@]:-herbstclient}" "$@" ;}
layoutdir=$HOME/.config/herbstluftwm/layouts/

layout=$(ls $layoutdir | rofi -dmenu -i -p "Layouts")
hc load "$(<${layoutdir}${layout})"

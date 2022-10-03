#!/usr/bin/env bash

hc() { "${herbstclient_command[@]:-herbstclient}" "$@" ;}
layoutdir=~/.config/herbstluftwm/layouts/

layout=$(ls $layoutdir | rofi -dmenu -p "Layouts: ")
hc load "$(<${layoutdir}${layout})"

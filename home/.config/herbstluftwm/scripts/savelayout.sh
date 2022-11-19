#!/usr/bin/env bash

hc() { "${herbstclient_command[@]:-herbstclient}" "$@" ;}
layoutdir=$HOME/.config/herbstluftwm/layouts/

layout=$(rofi -dmenu -p "Name")
[[ ! -z "$layout" ]] && hc dump > ${layoutdir}/${layout}

#!/bin/bash

# script: brightness.sh [n] -> brightness +/- 10n

brightness=$(xrandr --verbose | grep -i brightness | cut -f2 -d ' ' | head -n1)
n=$1
brightness=$(echo "$brightness + 0.1 * $n" | bc -l)

if (( $(echo "$brightness > 1" | bc -l) )); then
  brightness="1"
elif (( $(echo "$brightness < 0" | bc -l) )); then
  brightness="0"
fi
echo $brightness

xrandr --output DP-0 --brightness $brightness
xrandr --output HDMI-0 --brightness $brightness

brightness=$(echo "$brightness * 100" | bc -l)
brightness=$(echo ${brightness%.*})
DISPLAY=:0 dunstify -t 1000 -h string:x-dunst-stack-tag:brightness "Brightness" $brightness

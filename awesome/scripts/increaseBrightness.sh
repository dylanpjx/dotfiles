#!/bin/bash
BRIGHTNESS=`xrandr --verbose | grep -i brightness | cut -f2 -d ' ' | head -n1`

if (( $(echo "$BRIGHTNESS < 1" | bc -l) )); then
  BRIGHTNESS=$(echo "$BRIGHTNESS + 0.1" | bc -l)
  xrandr --output DP-0 --brightness $BRIGHTNESS
  xrandr --output HDMI-0 --brightness $BRIGHTNESS
fi

BRIGHTNESS=$(printf "%.1f" $BRIGHTNESS)
DISPLAY=:0 notify-send "Brightness" $BRIGHTNESS

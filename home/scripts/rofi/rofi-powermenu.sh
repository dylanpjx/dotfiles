#!/bin/sh

CHOSEN=$(printf "Suspend\nShutdown\nReboot\nExit" | rofi -dmenu -i -p "System:")

case "$CHOSEN" in
    "Suspend") systemctl suspend;;
    "Shutdown") shutdown -h now;;
    "Reboot") reboot ;;
    "Exit") herbstclient quit ;;
    *) exit 1 ;;
esac

#!/bin/sh

CHOSEN=$(printf "Shutdown\nSuspend\nReboot\nExit" | rofi -dmenu -i)

case "$CHOSEN" in
    "Shutdown") systemctl poweroff;;
    "Suspend") systemctl suspend;;
    "Reboot") reboot ;;
    "Exit") herbstclient quit ;;
    *) exit 1 ;;
esac

#!/bin/sh

CHOSEN=$(printf "Display Off\nSuspend\nShutdown\nReboot\nExit" | fuzzel --dmenu --prompt="System: ")

case "$CHOSEN" in
    "Display Off") niri msg action power-off-monitors ;;
    "Suspend") systemctl suspend;;
    "Shutdown") shutdown -h now;;
    "Reboot") reboot ;;
    "Exit") niri msg action quit ;;
    *) exit 1 ;;
esac

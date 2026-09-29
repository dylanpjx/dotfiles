#!/bin/bash
WINDOW=$(niri msg --json windows | jq -r '.[] | "[\(.workspace_id)] [\(.app_id)] \(.title) -> id: \(.id)"' | sort | fuzzel -d -w 50 | awk '{print $NF}')
if [ "$WINDOW" = "" ]; then exit; fi
niri msg action focus-window --id $WINDOW

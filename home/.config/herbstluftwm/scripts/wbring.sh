#!/usr/bin/env bash

hc() { ${herbstclient_command:-herbstclient} "$@" ;}

declare -i index=0
while read -r window; do
  IDS[$index]=$(echo "$window" | awk '{print $1}')
  ENTRIES[$index]=$(echo "$window" | awk '{for (i=2; i<=NF; ++i) print $i}')
  index+=1
done <<< "$(wmctrl -l)"

function gen_entries() {
  for a in $(seq 0 $(( ${#ENTRIES[@]} -1 ))); do
    echo ${ENTRIES[a]}
  done
}

selection=$(gen_entries | rofi -dmenu -i -p "Bring" -format i)
["$selection" = ""] && exit

wid=$(printf "%d" "${IDS[selection]}")

hc bring ${wid}

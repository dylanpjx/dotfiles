#!/bin/bash

# 1. Fetch all sink names, filter out EasyEffects, and store them in an array
mapfile -t sinks < <(pactl list short sinks | awk '{print $2}' | grep -v 'easyeffects_sink')

# 2. Find out which sink is currently set as the default
current=$(pactl get-default-sink)

# 3. Find the current sink in our array and cycle to the next one
for i in "${!sinks[@]}"; do
   if [[ "${sinks[$i]}" == "$current" ]]; then
       # The modulo operator (%) naturally wraps the index back to 0 at the end
       next_idx=$(( (i + 1) % ${#sinks[@]} ))
       pactl set-default-sink "${sinks[$next_idx]}"
       exit 0
   fi
done

# Fallback: If the current sink wasn't in the list (e.g. if EasyEffects was active),
# seamlessly default back to the first available hardware sink.
if [ ${#sinks[@]} -gt 0 ]; then
    pactl set-default-sink "${sinks[0]}"
fi

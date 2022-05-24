#!/usr/bin/env bash

imgpath="$HOME/Pictures/$(date +%F-%T).png"
maim -s -u $imgpath
xclip -selection clipboard -t image/png -i $imgpath

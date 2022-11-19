#!/usr/bin/env bash

imgpath="$HOME/Pictures/$(date +%F-%T).png"
maim -g $(slop) -u $imgpath
xclip -selection clipboard -t image/png -i $imgpath

#!/usr/bin/env bash

imgpath="$HOME/Pictures/$(date +%F-%T).png"
maim -g $(slop) -u $imgpath
xclip -selection clipboard -t image/png -i $imgpath

viewImgAction() {
  xdg-open $imgpath
}
action=$(DISPLAY=:0 dunstify -t 2000 -h string:x-dunst-stack-tag:ss "Screenshot saved" --action="viewImg, View")

if [ "$action" = "viewImg" ]
then
  viewImgAction
fi

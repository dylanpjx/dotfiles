#!/bin/bash

if [[ `ibus engine | awk -F":" '{ print $2 }'` == "us" ]]; then
	ibus engine 'libpinyin'
else
	ibus engine 'xkb:us::eng'
fi

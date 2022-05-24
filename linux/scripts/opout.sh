#!/bin/sh
# opout: "open output": A general handler for opening a file's intended output.
# I find this useful especially running from vim.

reader=zathura
basename="$(echo "$1" | sed 's/\.[^\/.]*$//')"

case "$1" in
	*.tex|*.md|*.rmd|*.ms|*.me|*.mom) setsid "$reader" "$basename".pdf >/dev/null 2>&1 & ;;
	*.html) setsid "$BROWSER" --new-window "$basename".html >/dev/null 2>&1 & ;;
esac

#!/bin/sh

# get the display
export DISPLAY=$(w -h $(whoami) | awk '$2 ~ /:[0-9.]*/{print $2}')
# open firefox
firefox 127.0.0.1:8080 &
sleep 10
# get firefox and hit F11
WID=$(xdotool search --onlyvisible --name firefox | head -1)
xdotool windowactivate ${WID}
xdotool key F11

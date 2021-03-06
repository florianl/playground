#!/bin/sh

# get the display
export DISPLAY=$(w -h $(whoami) | awk '$2 ~ /:[0-9.]*/{print $2}')
# open firefox
firefox https://trends.google.com/trends/hottrends/visualize &
sleep 10
# get firefox and hit F11
WID=$(xdotool search --onlyvisible --name firefox | head -1)
while [ -z "$WID" ]
do
        sleep 2
        WID=$(xdotool search --onlyvisible --name firefox | head -1)
done
xdotool windowactivate ${WID}
xdotool key F11

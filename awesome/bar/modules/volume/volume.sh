#! /bin/bash

if [[ $(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}') == *no* ]]; then
	pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}'
else
	pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/\%/M/'
fi

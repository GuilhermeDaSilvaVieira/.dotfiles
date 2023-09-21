#!/usr/bin/env bash

if [[ $1 == "up" ]]; then
	wpctl set-volume @DEFAULT_SINK@ 2%+ -l 1
else
	wpctl set-volume @DEFAULT_SINK@ 2%- -l 1
fi
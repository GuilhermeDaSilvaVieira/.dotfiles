#!/bin/sh
swayidle -w \
    timeout 300 'swaylock -f' \
    timeout 305 'niri msg action power-off-monitors' \
    resume 'niri msg action power-on-monitors'

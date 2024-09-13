#!/usr/bin/env bash


date=$(date +'%Y-%m-%d')
grimblast copysave ~/Pictures/Screenshots/screenshot-$date.png
notify-send -t 3000 "screenshot saved as ~/Pictures/Screenshots/screenshot-$date.png"

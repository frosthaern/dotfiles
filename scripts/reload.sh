#!/usr/bin/env bash


killall waybar
killall swaync
swaymsg reload
waybar &
swaync &

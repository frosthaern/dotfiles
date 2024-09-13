#!/usr/bin/env bash


killall waybar
killall swaync
hyprctl reload
waybar &
swaync &

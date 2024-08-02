#!/usr/bin/env bash


killall waybar
killall swaync
waybar &
swaync &

#!/usr/bin/env fish

set -l wallpaper (random choice $WALLPAPER_DIR/*)
echo $wallpaper
wal -i $wallpaper
hyprctl hyprpaper wallpaper "eDP-1, $wallpaper"
killall swaync
swaync &

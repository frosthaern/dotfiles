#!/usr/bin/env fish

set wallpaper $(hyprctl hyprpaper listloaded)
wal -i $wallpaper

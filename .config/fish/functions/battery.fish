#!/usr/bin/env fish

set battery_level $(/bin/cat /sys/class/power_supply/BAT0/capacity)

if test $battery_level -lt 20
    /use/bin/notify-send -t 5000 "battery level is $battery_level"
end

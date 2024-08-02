#!/usr/bin/env fish

notify-send -t 3000 "System Status" (begin
    echo -n "Battery status is: "(acpi -b)
    echo -n "\nVolume is: "(pamixer --get-volume)
    echo -n "\nIs mute: "(pamixer --get-mute)
end)

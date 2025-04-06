#!/usr/bin/env fish

set service (playerctl metadata | grep ".*xesam:url.*") || exit

if string match -qi "*youtube*" -- $service
    set icon "󰗃 "
else if string match -qi "*spotify*" -- $service
    set icon "󰓇 "
else if string match -qi "*twitch*" -- $service
    set icon "󰕃 "
else
    set icon "󰎇 "
end

set song (playerctl metadata title) || exit

echo "$icon  $song"

#!/usr/bin/env fish

set song (playerctl metadata title) || exit

echo "  $song"

#!/usr/bin/env fish

# source: https://github.com/vinitshahdeo/inspirational-quotes/blob/98d7a8d1148727873a20fd6b947880725bd6d8e7/data/data.json
set file (realpath ~/.config/hypr/hyprlock/scripts/quotes.json)

# print entries in separate lines
set quotes (jq -c '.[]' $file)
set count (count $quotes)

set index (random 1 $count)
set random_quote $quotes[$index]

set text (echo $random_quote | jq -r '.text')
set from (echo $random_quote | jq -r '.from')

echo -e "$text\n\n    — $from  [$index/$count]" | fold --spaces

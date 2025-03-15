#!/usr/bin/env fish

set file (realpath ~/.config/hypr/hyprlock/scripts/quotes.json)

set quotes (jq -c '.[]' $file)

set random_quote (random choice $quotes)

set text (echo $random_quote | jq -r '.text')
set from (echo $random_quote | jq -r '.from')

echo -e "$text\n\n    — $from" | fold --spaces

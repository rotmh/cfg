#!/usr/bin/env fish

set file (realpath ~/.config/hypr/hyprlock/scripts/quotes.jsonc)

# Use grep to strip out comments, as jq cannot parse JSONc (JSON with comments).
set quotes (grep -vE "^\s*//" $file | jq -c ".[]")
set count (count $quotes)

set index (random 1 $count)
set random_quote $quotes[$index]

set text (echo $random_quote | jq -r ".text")
set from (echo $random_quote | jq -r ".from")

echo -e "$text\n\n    — $from  [$index/$count]" | fold --spaces

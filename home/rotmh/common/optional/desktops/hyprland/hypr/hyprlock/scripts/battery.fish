#!/usr/bin/env fish

set battery_level (cat /sys/class/power_supply/BAT0/capacity)

# Determine icon based on battery level
if test $battery_level -le 10
    set icon " " # Empty
else if test $battery_level -le 25
    set icon " " # Quarter
else if test $battery_level -le 50
    set icon " " # Half
else if test $battery_level -le 75
    set icon " " # Three-quarters
else
    set icon " " # Full
end

echo "$icon  $battery_level"

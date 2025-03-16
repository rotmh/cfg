#!/usr/bin/env fish

set battery_level (cat /sys/class/power_supply/BAT0/capacity)

# Determine icon based on battery level
if test $battery_level -ge 90
    set icon " " # Full
else if test $battery_level -ge 75
    set icon " " # Three-quarters
else if test $battery_level -ge 50
    set icon " " # Half
else if test $battery_level -ge 25
    set icon " " # Quarter
else
    set icon " " # Empty
end

echo "$icon  $battery_level%"

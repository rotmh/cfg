set vol (pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '/Volume:/ {gsub(/[% ]/, "", $2); print $2; exit}')
set mute (pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

function change_volume
    set step 5

    switch $argv[1]
        case --up
            if test $vol -lt 100
                pactl set-sink-volume @DEFAULT_SINK@ "+$step%"
            end
        case --down
            pactl set-sink-volume @DEFAULT_SINK@ "-$step%"
    end
end

function print_state
    if test "$mute" = yes
        echo " "
    else
        echo "$vol"
    end
end

switch $argv[1]
    case --print
        print_state
    case --turn-up
        change_volume --up
    case --turn-down
        change_volume --down
    case --toggle-mute
        pactl set-sink-mute @DEFAULT_SINK@ toggle
end

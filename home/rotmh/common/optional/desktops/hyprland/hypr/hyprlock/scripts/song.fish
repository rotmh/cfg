function print_current
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
end

function print
    if not test (playerctl status | string length) -eq (string length "No players found")
        echo $argv[1]
    end
end

switch $argv[1]
    case --print-current
        print_current
    case --print
        print $argv[2]
end

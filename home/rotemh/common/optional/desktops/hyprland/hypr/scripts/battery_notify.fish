#!/usr/bin/env fish

if test -e "$XDG_RUNTIME_DIR/battery_script.pid"
    exit
end

echo $fish_pid >"$XDG_RUNTIME_DIR/battery_script.pid"

set sleep_time 30
set full_flag 0
set low_flag 0
set crit_flag 0
set vcrit_flag 0

while true
    set capc (cat /sys/class/power_supply/BAT*/capacity)

    if test (cat /sys/class/power_supply/BAT*/status) != Discharging
        shutdown -c --no-wall # cancel pending shutdowns if any

        set low_flag 0
        set crit_flag 0
        set vcrit_flag 0

        if test $capc = 100
            set sleep_time 10m

            if test $full_flag != 1
                notify-send "       energy replenished completely"

                set full_flag 1
            end
        else if test $capc -ge 30
            set sleep_time 5m
        else
            set sleep_time 1m
        end

    else # discharging state
        set full_flag 0

        if test $capc -ge 60
            set sleep_time 5m
        else
            set sleep_time 3m

            if test $capc -le 10
                set sleep_time 30

                if test low_flag != 1
                    notify-send "    battery low" "\nfind the charger" -u low -t 6000

                    set low_flag 1
                end
            end

            if test $capc -le 5
                set sleep_time 20

                if test crit_flag != 1
                    notify-send "    critical level" "plug-in charger asap" -u critical -t 6000
                    set crit_flag 1
                end
            end

            if test $capc -le 3
                set sleep_time 15

                if test vcrit_flag != 1
                    notify-send "    out of juice" "shutdown in 1 minute" -u critical -t 8000
                    shutdown --no-wall

                    set vcrit_flag 1
                end
            end
        end
    end

    sleep $sleep_time
end

#!/bin/env bash
# Credits: https://github.com/Ziqi-Yang/dotfiles/blob/ed202f4ee40c9de8546294b63121d4cbc34692da/dotfiles/config/polybar/scripts/pomodoro.sh

work_file="/tmp/uair-work"
break_file="/tmp/uair-break"

work_count=$(expr $(test -f $work_file && cat $work_file || echo -1) + 1)
break_count=$(expr $(test -f $break_file && cat $break_file || echo -1) + 1)

yellow=#df8e1d
green=#40a02b
grey=#9ca0b0

while read -r line; do
    read -a line <<< "$line"
    # format: {session} {state} {time}
    mode="${line[0],,}" # work or break
    state="${line[1]}" # pause or resume
    time="${line[2]}" # 4m 1s
    state_symbol="󰐊"
    if [[ "${state}" == "pause" ]]; then
        state_symbol="󰓛"
    fi

    if [[ $mode == "work" ]]; then
        if [[ "${time}" == "1s" || "${state}" == "" ]]; then
            work_count=$(( "$work_count" + 1 ))
        fi
        echo "%{F${yellow}}${state_symbol}%{F-} [${work_count}] %{F${green}}${time}%{F-}"
    elif [[ $mode == "break" ]]; then
        if [[ "${time}" == "1s" ]]; then
            break_count=$(( "$break_count" + 1 ))
        fi
        echo "%{F${grey}}${state_symbol}%{F-} [${break_count}] %{F${green}}${time}%{F-}"
    else
        echo Error $mode $line!
    fi
done < <(uair)

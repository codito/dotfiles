#!/usr/bin/sh
break_file="/tmp/uair-break"
break_count=$(expr $(test -f $break_file && cat $break_file || echo 0) + 1)

echo $break_count > $break_file

text="#$break_count breaks completed.\nBack to work!"
notify-send -a "Pomodoro" "$text"
zenity --info --text "$text"

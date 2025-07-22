#!/usr/bin/sh
work_file="/tmp/uair-work"
work_count=$(expr $(test -f $work_file && cat $work_file || echo 0) + 1)

echo $work_count > $work_file

text="#$work_count pomodoros completed.\nTake a break!"
notify-send -a "Pomodoro" "$text"
zenity --info --text "$text"

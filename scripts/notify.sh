#!/bin/bash

LOG="/run/user/$UID/hypr/$HYPRLAND_INSTANCE_SIGNATURE/hyprland.log"

# Check if log file exists
if [ ! -f "$LOG" ]; then
    notify-send -u critical "Hyprland Notification Error" "Log file $LOG not found."
    exit 1
fi

# Monitor log file for errors and warnings
tail -f "$LOG" | grep -Ei "error|warn|critical" | while read -r line; do
notify-send -u critical "Hyprland Alert" "$line"
done

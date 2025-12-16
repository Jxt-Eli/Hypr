
#!/bin/bash

# Warning levels (high → low)
LEVELS=(20 15 10 8)

SOUND_FILE="/usr/share/sounds/freedesktop/stereo/dialog-warning.oga"
CHECK_INTERVAL=60   # check every minute

# Track which levels have already warned
declare -A WARNED

for lvl in "${LEVELS[@]}"; do
    WARNED[$lvl]=false
done

while true; do
    CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    # Only warn when discharging
    if [ "$STATUS" = "Discharging" ]; then
        for lvl in "${LEVELS[@]}"; do
            if [ "$CAPACITY" -le "$lvl" ] && [ "${WARNED[$lvl]}" = false ]; then
                
                # Send notification
                notify-send -u critical "Low Battery" "Battery is at ${CAPACITY}%"
                
                # Play calm alert sound
                paplay "$SOUND_FILE"
                
                # Mark this level as warned
                WARNED[$lvl]=true
            fi
        done
    else
        # Reset all warnings when charging
        for lvl in "${LEVELS[@]}"; do
            WARNED[$lvl]=false
        done
    fi

    sleep "$CHECK_INTERVAL"
done


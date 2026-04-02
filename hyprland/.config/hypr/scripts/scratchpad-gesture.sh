#!/bin/bash
# Toggles scratchpad with animation direction matching the gesture.
# Usage: scratchpad-gesture.sh up|down

DIR="$1"
ON_SPECIAL=$(hyprctl -j monitors | grep -q '"special:magic"' && echo 1 || echo 0)

if [ "$DIR" = "up" ]; then
    if [ "$ON_SPECIAL" = "1" ]; then
        ANIM="slidefadevert -50%"  # closing: disappear upward
    else
        ANIM="slidevert"            # opening: appear from bottom
    fi
else
    if [ "$ON_SPECIAL" = "1" ]; then
        ANIM="slidevert"            # closing: disappear downward
    else
        ANIM="slidefadevert -50%"  # opening: appear from top
    fi
fi

hyprctl keyword animation "specialWorkspace,1,3,easeOutQuint,$ANIM"
hyprctl dispatch togglespecialworkspace magic

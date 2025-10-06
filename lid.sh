#!/bin/bash

# Replace eDP-1 and DP-1 with your names from Step 1
INTERNAL="eDP-1"
EXTERNAL="DP-1"

# File to store lid state (0 = disabled, 1 = enabled)
STATE_FILE="$(dirname "$0")/lid_state.log"

# Function to read lid state from file (returns 0 or 1, defaults to 1 if file doesn't exist)
read_lid_state() {
    if [ -f "$STATE_FILE" ]; then
        cat "$STATE_FILE"
    else
        echo "1"  # Default to enabled if no file
    fi
}

# Function to write lid state to file
write_lid_state() {
    echo "$1" > "$STATE_FILE"
}

# Check current state and toggle
CURRENT_STATE=$(read_lid_state)

if [[ $CURRENT_STATE == "1" ]] && hyprctl monitors | grep -q "$EXTERNAL"; then
    hyprctl keyword monitor "$INTERNAL,disable"
    hyprctl keyword monitor "$EXTERNAL,preferred,auto,1.5"
    write_lid_state 0
else
    hyprctl keyword monitor "$INTERNAL,preferred,auto,1.5"
    write_lid_state 1
fi


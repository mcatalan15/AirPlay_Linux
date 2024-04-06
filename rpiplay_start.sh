#!/bin/bash

# Function to start rpiplay
start_rpiplay() {
    echo "Starting rpiplay"
    rpiplay -n "AirPlay" -a hdmi -d -b on &
    # Save the process ID of the rpiplay command
    RPIPLAY_PID=$!
}

# Function to check if rpiplay is running
is_rpiplay_running() {
    # Check if the process exists
    if ps -p $RPIPLAY_PID > /dev/null; then
        return 0 # Process is running
    else
        return 1 # Process is not running
    fi
}

# Main loop
while true; do
    # Start rpiplay
    start_rpiplay

    # Check if rpiplay is running
    while is_rpiplay_running; do
        sleep 1
    done

    # If rpiplay has finished, display a message and restart
    echo "rpiplay process has finished. Restarting..."
done


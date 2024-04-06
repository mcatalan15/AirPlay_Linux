#!/bin/bash

while true; do
    # Check if rpiplay window is open
    if pgrep -x "rpiplay" > /dev/null
    then
        # If rpiplay is running, maximize the window
        wmctrl -r "rpiplay" -b add,maximized_vert,maximized_horz
    fi
    # Wait for a few seconds before checking again
    sleep 5
done


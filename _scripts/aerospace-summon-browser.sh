#!/bin/bash

# Get browser window string
window_str=$(aerospace list-windows --all | grep "Zen")

# Extrapolate ID from window string
window=${window_str%%|*}
window=$(echo "$window" | xargs)  # optional trim

# Get current workspace ID
workspace=$(aerospace list-workspaces --focused)



aerospace move-node-to-workspace --window-id "$window" "$workspace"
aerospace focus --window-id "$window"
aerospace fullscreen

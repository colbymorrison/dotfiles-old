#! /bin/bash
CON=$(xrandr | grep " connected")
CON_LINES=$(echo "$CON" | wc | awk '{print $1}')

# Get the line of output corresponding to the number of lines of the output
# 1 means primary is connected 2 lines means HDMI is connected
DISPLAY_LN=$(echo "$CON" | head -n $CON_LINES | tail -1)
echo $DISPLAY_LN

export DISPLAY_NM=$(echo $DISPLAY_LN | cut -d ' ' -f 1)
export DISPLAY_SZ=$(echo $DISPLAY_LN | cut -d ' ' -f 4)

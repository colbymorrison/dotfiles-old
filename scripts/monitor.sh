#! /bin/bash
CON=$(xrandr | grep " connected")
CON_LINES=$(echo "$CON" | wc | awk '{print $1}')

# Get the line of output corresponding to the number of lines of the output
# 1 means primary is connected 2 lines means HDMI is connected
DISPLAY_LN=$(echo "$CON" | head -n $CON_LINES | tail -1)

export DISPLAY_NM=$(echo $DISPLAY_LN | awk '{print $1}')
export DISPLAY_SZ=$(echo $DISPLAY_LN | awk '{print $3}')

if [ "${CON_LINES}" -gt 1 ]; then
   xrandr --output eDP1 --off
   echo 0 > /sys/devices/platform/applesmc.768/leds/smc::kbd_backlight/brightness
fi

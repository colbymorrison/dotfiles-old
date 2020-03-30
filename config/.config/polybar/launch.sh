#! /bin/bash

# Terminate already running bar instances
kill -9 $(pgrep polybar)

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 3; done

# Temp file (it changes)
base=/sys/devices/platform/coretemp.0/hwmon
[[ -d $base/hwmon0 ]] && export HWMON="$base/hwmon0/temp1_input" || export HWMON="$base/hwmon1/temp1_input"

# Wal config file
source  ~/.cache/wal/polybar-colors.sh

# Start on all monitors with right font size
for m in $(polybar --list-monitors | cut -d":" -f1); do
    # Can change font size by monitor here
    FONT_SZ=11

    export NOTOT="NotoSans-Bold:size=$FONT_SZ;0"
    export DEJA="DejaVuSans-Bold:size=$FONT_SZ;1"
    export TERMST="Termsynu:size=$FONT_SZ:antialias=false;-2"
    export AWSM="Font Awesome 5 Free Solid:size=$(($FONT_SZ+2));0"
    export AWSB="FontAwesome 5 Brands Regular:size=$(($FONT_SZ+2));0"

    MONITOR=$m polybar --reload top &
done


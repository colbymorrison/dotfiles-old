#! /bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Fonts
width=$(echo $DISPLAY_SZ | sed 's/x.*//g')
# font_sz is our 12
# 1080p
if [[ $width -le 1920 ]]; then
    font_sz=12
# Mac
elif [[ $width -le 2560 ]]; then
    font_sz=14
# 4k
else
    font_sz=16
fi

echo "POLYBAR FONTSIZE: $font_sz"

# TODO: change to multiple bars started in if above w/ no env vars? 
export NOTOT="NotoSans-Regular:size=$font_sz;-1"
export MATRT="MaterialIcons:size=$(($font_sz+2));0"
export TERMST="Termsynu:size=$font_sz:antialias=false;-2"
export AWST="FontAwesome:size=$(($font_sz+2));0"
export NOTOB="NotoSans-Regular:size=$font_sz;0"
export UNIB="unifont:size=$(($font_sz-2));-3"
export AWSB="FontAwesome:size=$font_sz;0"
export MATRB="MaterialIcons:size=$(($font_sz-2));-1"
export TERMSB="Termsynu:size=$font_sz:antialias=false;0"

#Launch bar1 and bar2
polybar top &
polybar bottom &

echo "Bars launched..."

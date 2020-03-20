#! /bin/bash

# Terminate already running bar instances
killall polybar
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 3; done

if [[ -n $1 ]]; then
 export MONITOR=$1 
else
  export MONITOR="eDP1"
fi

FONT_SZ=20

[[ $MONITOR != "eDP1" ]]  && FONT_SZ=18

# TODO: change to multiple bars started in if above w/ no env vars? 
export NOTOT="NotoSans-Regular:size=$FONT_SZ;-1"
export MATRT="MaterialIcons:size=$(($FONT_SZ+2));0"
export TERMST="Termsynu:size=$FONT_SZ:antialias=false;-2"
export AWST="Font Awesome 5 Free Solid:size=$(($FONT_SZ+2));0"

polybar laptop &

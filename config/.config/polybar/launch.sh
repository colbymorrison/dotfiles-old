#! /bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


# TODO: change to multiple bars started in if above w/ no env vars? 
export NOTOT="NotoSans-Regular:size=$FONT_SZ;-1"
export MATRT="MaterialIcons:size=$(($FONT_SZ+2));0"
export TERMST="Termsynu:size=$FONT_SZ:antialias=false;-2"
export AWST="FontAwesome:size=$(($FONT_SZ+2));0"
export NOTOB="NotoSans-Regular:size=$FONT_SZ;0"
export UNIB="unifont:size=$(($FONT_SZ-2));-3"
export AWSB="FontAwesome:size=$FONT_SZ;0"
export MATRB="MaterialIcons:size=$(($FONT_SZ-2));-1"
export TERMSB="Termsynu:size=$FONT_SZ:antialias=false;0"

#Launch bar1 and bar2
polybar top &
polybar bottom &

echo "Bars launched..."

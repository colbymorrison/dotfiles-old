#! /bin/bash

# number of currently running sinks
# doesnt seem to work on current machine as number changes
# do i need it?
num_sinks=$(pactl list short sinks | wc -l)

for SINK in $(seq 0 $(($num_sinks-1)))
do 
    echo $SINK
    case "$1" in
        up)
            pactl set-sink-volume $SINK +1000
            ;;
        down)
            pactl set-sink-volume $SINK -1000
            ;;
        mute)
            pactl set-sink-mute $SINK toggle
            ;;
    esac
done
  


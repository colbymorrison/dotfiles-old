#! /bin/bash

LOG_OUT="\tLog Out"
POWER_OFF="\tPower Off"
REBOOT="\tReboot"
SUSPEND="\tSuspend"
HIBERNATE="\tHibernate"
LOCK="\tLock Screen"

options="$POWER_OFF\n$REBOOT\n$LOG_OUT\n$SUSPEND\n$HIBERNATE\n$LOCK"

option=$(echo -e $options | rofi -dmenu -p " ")

echo $option
case $option in
    *"Power Off")
        tmux-session save
        poweroff
        ;;
    *"Reboot")
        tmux-session save
        systemctl reboot
        ;;
    *"Log Out")
        bspc quit
        ;;
    *"Suspend")
        systemctl suspend 
        ;;
    *"Hibernate")
        systemctl hibernate
        ;;
    *"Lock Screen")
        xset s activate
        ;;
    *)
        ;;
esac

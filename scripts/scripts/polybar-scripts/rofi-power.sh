#! /bin/bash

LOG_OUT="\tLog Out"
POWER_OFF="\tPower Off"
REBOOT="\tReboot"
SUSPEND="\tSuspend"
HIBERNATE="\tHibernate"
LOCK="\tLock Screen"

options="$POWER_OFF\n$REBOOT\n$LOG_OUT\n$LOCK\n$SUSPEND\n$HIBERNATE"

option=$(echo -e $options | rofi -dmenu -p " ")

echo $option
case $option in
    *"Power Off")
        poweroff
        ;;
    *"Reboot")
        systemctl reboot
        ;;
    *"Log Out")
        bspc quit
        ;;
    *"Suspend")
        betterlockscreen -s dim
        ;;
    *"Hibernate")
        systemctl hibernate
        ;;
    *"Lock Screen")
        betterlockscreen -l dim
        ;;
    *)
        ;;
esac

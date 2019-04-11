#! /bin/bash

if [ "$(systemctl is-active bluetooth.service)" = "active" ]; then
  device=$(bluetoothctl -- paired-devices)
  deviceId=$(echo $device | cut -f 2 -d ' ')
  if [ "$(bluetoothctl -- info $deviceId | grep Connected: | sed 's/Connected://g'|sed 's/^[ \t]*//')" == "yes" ]; then
    echo "  $(echo $device | cut -f 3- -d ' ')"
  else
    echo  
  fi
else
  echo  
fi


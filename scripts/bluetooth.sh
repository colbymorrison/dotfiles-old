#! /bin/bash

if [ "$(systemctl is-active bluetooth.service)" = "active" ]; then
  devices=$(bluetoothctl -- paired-devices)
  if [ "$(echo $devices | wc -l)" -gt 0 ]; then
    echo "  $(echo $devices | cut -f 3- -d ' ')"
  else
    echo  
  fi
else
  echo  
fi


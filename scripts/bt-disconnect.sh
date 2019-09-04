#! /bin/bash

if [ "$(systemctl is-active bluetooth.service)" = "active" ]; then
  device=$(cat /tmp/bt-name)

  if [ "$device" == '' ]; then
    echo "No device connected!"
    exit 1
  fi

  deviceId=$(bluetoothctl -- devices | grep $device | cut -d ' ' -f 2)

  bluetoothctl -- disconnect $deviceId > /dev/null

  if [ "$(bluetoothctl -- info $deviceId | grep Connected: | sed 's/Connected://g'|sed 's/^[ \t]*//')" != "no" ]; then
    echo "Failed to disconnect $deviceName"
    exit 1
  else
    echo "$deviceName disconnected"
    echo   > /tmp/bt-info
    echo > /tmp/bt-name
  fi

  polybar-msg hook bluetooth 1
else
    echo "Bluetooth service is not on. Try \"systemctl start bluetooth\"\?"
fi






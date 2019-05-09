#! /bin/bash
if [ "$(systemctl is-active bluetooth.service)" = "active" ]; then
  device=$(bluetoothctl -- devices | grep "$1")
  deviceID=$(echo $device | cut -d ' ' -f 2)

  if [ "$(bluetoothctl -- info $deviceId | grep Connected: | sed 's/Connected://g'|sed 's/^[ \t]*//')" == "yes" ]; then
    echo "  $(echo $device | cut -f 3- -d ' ')" > /tmp/bt-info
  else
    # Connect
    bluetoothctl -- connect $deviceID
    # Make sure we connected
    if [ "$(bluetoothctl -- info $deviceId | grep Connected: | sed 's/Connected://g'|sed 's/^[ \t]*//')" == "yes" ]; then
     echo "  $(echo $device | cut -f 3- -d ' ')" > /tmp/bt-info
    else
      echo "Could not connect to $device"
      echo   > /tmp/bt-info
    fi
  fi
else
  echo "Bluetooth service is not on. Try \"systemctl start bluetooth\"\?"
fi


polybar-msg hook bluetooth 1


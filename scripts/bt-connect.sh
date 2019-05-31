#! /bin/bash

connect () {
  # Gotta pass device as parameter
  if [ $# -lt 1 ]; then
    printf "Pass device as a parameter\n"
    printf "Make one of\n$(bluetoothctl devices)\n"
    exit 1
  fi

  # Make sure bluetooth daemon is on
  if [ "$(systemctl is-active bluetooth.service)" = "active" ]; then
    device=$(bluetoothctl -- devices | grep "$1")
    deviceID=$(echo $device | cut -d ' ' -f 2)
    deviceName=$(echo $device | cut -f 3- -d ' ')

    # Already connected?
    if [ "$(bluetoothctl -- info $deviceId | grep Connected: | sed 's/Connected://g'|sed 's/^[ \t]*//')" == "yes" ]; then
      echo "$deviceName is already connected!"
      connectedFile
    else
    # Power on if necissary
    if [ "$(bluetoothctl show | grep Powered | cut -d ' ' -f 2)" != "yes" ] ; then
      bluetoothctl power on
    fi

    # Power on
    bluetoothctl -- connect $deviceID
    # Make sure we're connected
    if [ "$(bluetoothctl -- info $deviceId | grep Connected: | sed 's/Connected://g'|sed 's/^[ \t]*//')" == "yes" ]; then
      connectedFile
    else
      echo "Could not connect to $device"
      echo   > /tmp/bt-info
      echo > /tmp/bt-name
    fi
    fi
  lse
    echo "Bluetooth service is not on. Try \"systemctl start bluetooth\"\?"
    fi

    polybar-msg hook bluetooth 1
  }


# Write to bt-info files
connectedFile () {
  echo "" > /tmp/bt-info
  echo $deviceName > /tmp/bt-name
}

connect $*


#! /bin/bash

while read -r line; do
  [[ "$line" != *"LID0"* && "$line" == *"enabled"* ]] && echo $line | cut -d ' ' -f 1 > /proc/acpi/wakeup 
done < /proc/acpi/wakeup

exit 0

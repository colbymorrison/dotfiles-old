#! /bin/bash

# Keyboard & mouse to resume from suspend

sed -E '/PS2K|PS2M/ s/disabled/enabled/' /proc/acpi/wakeup > /proc/acpi/wakeup

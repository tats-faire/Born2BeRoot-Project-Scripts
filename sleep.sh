#!bin/bash

# Get minute and second of boot time
BOOT_MINUTES=$(uptime -s | cut -d ":" -f 2)
BOOT_SECONDS=$(uptime -s | cut -d ":" -f 3)

# The configured cronjob would usually trigger every full 10 minutes, e.g. at 14:10:00
# But it should trigger every 10 minutes after boot
# E.g., if boot time was at 14:12:55, then the cronjob should execute monitoring.sh at 14:22:55 (and every 10 minutes later)
# Thus, the delay should be 0:02:55, so BOOT_MINUTES and BOOT_SECONDS
# Or in total seconds:
DELAY=$(bc <<< $BOOT_MINUTES % 10 * 60 + $BOOT_SECONDS)
sleep $DELAY

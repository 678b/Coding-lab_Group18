#!/bin/bash

echo "Select log file to analyze: "
echo "1) Heart Rate (heart_rate.log) "
echo "2) Temperature (temperature.log) "
echo "3) Water Usage (water_usage.log) "

while true
do
  read -p "Enter choice (1-3): " choice

  case $choice in
   1)
     echo "You selected Heart Rate log."
     LOG_FILE="hospital_data/active_logs/heart_rate.log"
     LOG_TYPE="Heart Rate"
     break
     ;;
   2)
     echo "You selected Temperature log."
     LOG_FILE="hospital_data/active_logs/temperature.log"
     LOG_TYPE="Temperature"
     break
     ;;
   3)
     echo "You selected Water Usage log."
     LOG_FILE="hospital_data/active_logs/water_usage.log"
     LOG_TYPE="Water Usage"
     break
     ;;
   *)
     echo "Invalid input! Try again."
     ;;
  esac
done

if [! -f "$LOG_FILE"]; then
    echo "Error: Log file not found: $LOG_FILE"
    exit 1
fi

echo "Analyzing $LOG_TYPE logs..."
echo ""

# Occurences for each device
echo "Device Statistics:"
awk -F'Device: |[[:space:]]-' '{print $2}' "$LOG_FILE" | \
    sort | uniq -c | \
    awk '{print $2": "$1" occurrences"}'

echo ""

# first/last Timestamp per device
echo "First/Last Entr Times:"
devices = $(awk -F'Device: |[[:space:]]- ' '{print $2}' "$LOG_FILE" | sort -u)

for device in $devices; do
    first=$(grep "Device: $device" "$LOG_FILE" | head -1 | awk '{print $1, $2}')
    last=$(grep "Device: $device" "$LOG_FILE" | tail -1 | awk '{print $1, $2}')

    echo "$device:"
    echo " First: $first"
    echo " Last: $last"
done

echo ""
echo "Analysis complete!"

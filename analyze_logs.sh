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
     break
     ;;
   2)
     echo "You selected Temperature log."
     break
     ;;
   3)
     echo "You selected Water Usage log."
     break
     ;;
   *)
     echo "Invalid input! Try again."
     ;;
  esac
done


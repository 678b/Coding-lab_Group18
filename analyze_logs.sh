#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

LOG_DIR="$SCRIPT_DIR/hospital_data/active_logs"
REPORT_DIR="$SCRIPT_DIR/hospital_data/reports"
REPORT_FILE="$REPORT_DIR/analysis_report.txt"

mkdir -p "$REPORT_DIR"

# ----------------------------------------
# CLI MENU
# ----------------------------------------
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate_log.log)"
echo "2) Temperature (temperature_log.log)"
echo "3) Water Usage (water_usage_log.log)"
echo ""

while true; do
  read -p "Enter choice (1-3): " choice

  case "$choice" in
    1)
      LOG_FILE="$LOG_DIR/heart_rate_log.log"
      LOG_TYPE="Heart Rate"
      break
      ;;
    2)
      LOG_FILE="$LOG_DIR/temperature_log.log"
      LOG_TYPE="Temperature"
      break
      ;;
    3)
      LOG_FILE="$LOG_DIR/water_usage_log.log"
      LOG_TYPE="Water Usage"
      break
      ;;
    *)
      echo "Invalid input! Try again."
      ;;
  esac
done

# ----------------------------------------
# Validate log file
# ----------------------------------------
if [ ! -f "$LOG_FILE" ]; then
  echo "Error: Log file not found: $LOG_FILE"
  exit 1
fi

echo ""
echo "Analyzing $LOG_TYPE log..."
echo "Results will be appended to:"
echo "$REPORT_FILE"
echo ""

# ----------------------------------------
# ANALYSIS (APPENDING)
# ----------------------------------------
{
  echo ""
  echo "=============================================="
  echo "NEW RUN - $(date)"
  echo "=============================================="
  echo "=============================="
  echo "Hospital Log Analysis Report"
  echo "Log Type   : $LOG_TYPE"
  echo "Generated  : $(date)"
  echo "=============================="
  echo ""

  echo "Device Statistics:"
  awk -F'Device: |[[:space:]]-' '{print $2}' "$LOG_FILE" \
    | sort \
    | uniq -c \
    | awk '{print "  " $2 ": " $1 " occurrences"}'

  echo ""
  echo "First / Last Entry Times:"

  devices=$(awk -F'Device: |[[:space:]]-' '{print $2}' "$LOG_FILE" | sort -u)

  for device in $devices; do
    first=$(grep "Device: $device" "$LOG_FILE" | head -n 1 | awk '{print $1, $2}')
    last=$(grep "Device: $device" "$LOG_FILE" | tail -n 1 | awk '{print $1, $2}')

    echo "  Device: $device"
    echo "    First Entry: $first"
    echo "    Last Entry : $last"
    echo ""
  done

  echo "Analysis complete."
  echo "=============================================="
} >> "$REPORT_FILE"

echo "Done ✔"


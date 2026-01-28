#!/bin/bash

ACTIVE_DIR="hospital_data/active_logs"
ARCHIVE_DIR="hospital_data/archive_logs"

echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

# Timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")

case $choice in
    1)
        LOG_FILE="heart_rate.log"
        ;;
    2)
        LOG_FILE="temperature.log"
        ;;
    3)
        LOG_FILE="water_usage.log"
        ;;
    *)
        echo "❌ Invalid choice. Please enter 1, 2, or 3."
        exit 1
        ;;
esac

# Check active log exists
if [ ! -f "$ACTIVE_DIR/$LOG_FILE" ]; then
    echo "❌ Log file not found: $ACTIVE_DIR/$LOG_FILE"
    exit 1
fi

# Ensure archive directory exists
mkdir -p "$ARCHIVE_DIR"

ARCHIVED_NAME="${LOG_FILE%.log}_$TIMESTAMP.log"

echo "Archiving $LOG_FILE..."

mv "$ACTIVE_DIR/$LOG_FILE" "$ARCHIVE_DIR/$ARCHIVED_NAME"

# Create new empty log
touch "$ACTIVE_DIR/$LOG_FILE"

echo "✅ Successfully archived to $ARCHIVE_DIR/$ARCHIVED_NAME"


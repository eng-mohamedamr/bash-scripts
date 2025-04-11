#!/bin/bash

# Define variables
BACKUP_DIR="/var/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/home_backup_$TIMESTAMP.tar.gz"
LOG_FILE="/var/log/backup.log"
EMAIL="elbasuoneytest@gmail.com"  # Change this to your email

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Start logging
echo "[$(date)] Starting backup..." >> "$LOG_FILE"

# Create the compressed backup
tar -czf "$BACKUP_FILE" /home 2>>"$LOG_FILE"

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "[$(date)] Backup successful: $BACKUP_FILE" >> "$LOG_FILE"
    echo "Backup successful $(hostname) at $(date)" | mail -s "Backup successful Alert" "$EMAIL"
else
    echo "[$(date)] Backup FAILED!" >> "$LOG_FILE"
    echo "Backup failed on $(hostname) at $(date)" | mail -s "Backup Failure Alert" "$EMAIL"
    exit 1
fi

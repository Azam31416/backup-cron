#!/bin/bash

# ==== CONFIGURATION ====
BACKUP_SRC="/etc /var/www/"
BACKUP_DEST="/mnt/backup-media"
BACKUP_NAME="backup-$(date +%F_%H-%M-%S).tar.gz"
LOG_FILE="/home/user/backup_logs/backup.log"

# ==== CREATE LOG DIR ====
mkdir -p "$(dirname "$LOG_FILE")"

# ==== START BACKUP ====
{
    echo "=== Backup started at $(date) ==="

    # Create backup
    tar -czf "$BACKUP_DEST/$BACKUP_NAME" $BACKUP_SRC

    if [ $? -eq 0 ]; then
        echo "Backup successful: $BACKUP_NAME"
        STATUS="Success"
    else
        echo "Backup failed!"
        STATUS="Failed"
    fi

    echo "=== Backup ended at $(date) ==="
    echo ""
} >> "$LOG_FILE" 2>&1

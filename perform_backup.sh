#!/bin/bash

# Define variables
SOURCE_DIR="/path/to/source/directory"  # Specify the directory you want to back up
REMOTE_USER="remote_user"              # Username on the remote server
REMOTE_HOST="remote_host"              # IP address or hostname of the remote server
REMOTE_DIR="/path/to/remote/backup/directory"  # Directory on the remote server to store backups
LOG_FILE="/var/log/backup.log"         # Log file path for recording backup activity
DATE=$(date '+%Y-%m-%d_%H-%M-%S')      # Current date and time for timestamping backups

# Function to perform backup
perform_backup() {
    echo "Starting backup at $(date)" >> "$LOG_FILE"
    
    # Use rsync to perform the backup
    rsync -avz --delete "$SOURCE_DIR" -e ssh "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/$DATE" >> "$LOG_FILE" 2>&1
    
    # Check rsync exit status
    if [ $? -eq 0 ]; then
        echo "Backup successful at $(date)" >> "$LOG_FILE"
        echo "Backup successful!"
    else
        echo "Backup failed at $(date)" >> "$LOG_FILE"
        echo "Backup failed! Check $LOG_FILE for details."
    fi
}

# Main execution
perform_backup

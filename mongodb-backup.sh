#!/bin/bash

# Connect to MongoDB replica set and trigger backup
# Replace <mongodb-host> with actual MongoDB host
mongodump --host <mongodb-host> --out /backup

# Zip backup files
tar -czvf /backup/mongodb-backup-$(date +%Y-%m-%d_%H-%M-%S).tar.gz /backup

# Clean up old backups (optional)
find /backup -type f -name '*.tar.gz' -mtime +7 -exec rm {} \;
